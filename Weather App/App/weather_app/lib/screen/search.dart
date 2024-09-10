import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/search_info.dart'; // Make sure this is the correct path
import 'package:weather_app/widget/my_center.dart';
import 'package:weather_app/widget/my_circle.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Feature> items = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      final query = _searchController.text;
      if (query.isNotEmpty) {
        placeAutoComplete(query);
      } else {
        setState(() {
          items = [];
        });
      }
    });
  }

  Future<void> placeAutoComplete(String val) async {
    final List<Feature> suggestions = await addressSuggestions(val);
    setState(() {
      items = suggestions;
    });
  }

  Future<List<Feature>> addressSuggestions(String address) async {
    try {
      Response response = await Dio().get("https://photon.komoot.io/api/",
          queryParameters: {"q": address, "limit": 5});
      final json = response.data;
      return (json['features'] as List)
          .map((e) => Feature.fromJson(e))
          .toList();
    } catch (e) {
      return [];
    }
  }

  void onItemSelected(Feature feature) {
    setState(() {
      _searchController.text = feature.properties?.name ?? 'Unknown';
      items = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        child: Container(
          color: Colors.black,
          child: Stack(
            children: [
              myCircle(
                  size: 218, color: Colors.deepPurple, left: 1.2, top: 0.09),
              myCircle(
                  size: 218, color: Colors.deepPurple, left: -1.2, top: 0.09),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  width: 600,
                  height: 400,
                  decoration: const BoxDecoration(color: Color(0xffffAB40)),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: _searchController,
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              placeAutoComplete(val);
                            } else {
                              setState(() {
                                items = [];
                              });
                            }
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: const TextStyle(color: Colors.white),
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        ...items.map(
                          (e) => ListTile(
                            leading: const Icon(Icons.location_on,
                                color: Colors.white),
                            textColor: Colors.white,
                            style: ListTileStyle.list,
                            title: Text(e.properties?.name ?? 'Unknown'),
                            subtitle: Text(
                              '${e.properties?.city ?? 'No City'}, ${e.properties?.country ?? 'No Country'}',
                            ),
                            onTap: () => onItemSelected(e),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          color: Colors.white,
                        ),
                        const SizedBox(height: 10),
                        myCenter(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              fixedSize: const Size(200, 50),
                            ),
                            onPressed: () {
                              // Implement current location functionality
                            },
                            child: const Text(
                              "Use current location",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
