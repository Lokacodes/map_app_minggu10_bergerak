enum Type {normal, hybrid, terrain, satellite}

class MapTypeGoogle {
  Type type;
  MapTypeGoogle({required this.type});
}

List<MapTypeGoogle> googleMapTypes = [
  MapTypeGoogle(type: Type.normal),
  MapTypeGoogle(type: Type.hybrid),
  MapTypeGoogle(type: Type.terrain),
  MapTypeGoogle(type: Type.satellite),
];