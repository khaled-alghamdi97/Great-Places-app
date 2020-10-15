final String GOOGLE_MAP_API_KEY = "AIzaSyBGlZnCDYRsDfVfj0LC0vgoeIsBhr5sxHQ";

class LoacationHelper {
  static String getImagePreviewUrl({double lat, double lon}) {
    return "https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lon&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$lat,$lon&key=$GOOGLE_MAP_API_KEY";
  }
}
