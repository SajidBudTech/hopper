import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
//import 'package:metadata_extract/metadata_extract.dart';

import '../../models/storyItem.dart';

class MetadataPreviewImage extends StatefulWidget {
  MetadataPreviewImage(
      {this.pageURL, this.height, this.width, this.fit, this.story});
  final String pageURL;
  final double height;
  final double width;
  final BoxFit fit;
  final StoryItem story;
  @override
  _MetadataPreviewImageState createState() => _MetadataPreviewImageState();
}

class _MetadataPreviewImageState extends State<MetadataPreviewImage> {
  /*String _imageURL;
  bool _loaded = false;
  int _loadedID = -1;

  void getMetaData() async {
    if (_loadedID == widget.story.storyId) {
      print("metadata image already loaded");
      return;
    } else {
      print("fetching image from metadata");
    }
    if (widget.story != null && widget.story.imageUrl != null) {
      print("imageurl already defined");
      _imageURL = widget.story.imageUrl;
      _loadedID = widget.story.storyId;
      return;
    }
    //print("loading metadata for ${widget.pageURL}");
    String url = Uri.encodeFull(widget.pageURL);
    var data = await extract(url);
    setState(() {
      print("image url received");
      Uri imageUri = Uri.tryParse(data.image);
      if (imageUri != null) {
        _imageURL = imageUri.replace(scheme: "https").toString();
      } else {
        _imageURL = "";
      }
      //Save fetched imageURL for later if story is set
      if (widget.story != null) {
        widget.story.imageUrl = _imageURL;
      }
      _loadedID = widget.story.storyId;
    });
  }*/

  @override
  Widget build(BuildContext context) {
   /* getMetaData();
    return _loadedID == widget.story.storyId
        ? CachedNetworkImage(
            fit: widget.fit,
            height: widget.height,
            width: widget.width,
            imageUrl: _imageURL,
          )
        : Container(
            width: widget.width,
            height: widget.height,
          );*/
     return Container();
  }
}
