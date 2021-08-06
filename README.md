# audio_hopper

Real news, narrated.

## Getting Started

If you are brand new to flutter, follow along with this video. 
https://www.youtube.com/watch?v=x0uinJvhNxI
(41:32 for Windows Setup)
Don't forget the Set Up USB Driver Step (56:29) 

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## File Structure
assets/
    Contains creative assets like icons and logos 
assets/example_audio
    Temporary respository of select audio files so the app can function in a purely locally version
    This should be unecessary and removed before official release.
data/
    So far contains only example data for testing. Like example_audio, this is needed for a local version of the app, but should be made obsolete and deleted eventually
lib/
    Top level contains only main.dart, the main entry ppoint and app controller
    Also, a generated plugin file
lib/views
    Contains the main views that make up the app (e.g. Story List, Hopper Queue, Settings, etc)
libs/views/components
    Contains subcomponent widget that are used to make up the main views.
libs/models
    Contains data structures and logical classes that are not flutter widgets
    Most notable is HopperModel, which contains most of the basic app logic, and the audio control
