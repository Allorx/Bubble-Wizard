components {
  id: "stair"
  component: "/assets/stairs/stair.script"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "model"
  type: "model"
  data: "mesh: \"/assets/test/stair.dae\"\n"
  "material: \"/assets/test/unlit.material\"\n"
  "textures: \"/assets/test/purple_checkerboard.jpg\"\n"
  "skeleton: \"\"\n"
  "animations: \"\"\n"
  "default_animation: \"\"\n"
  "name: \"unnamed\"\n"
  ""
  position {
    x: 0.0
    y: -1.0
    z: 3.0
  }
  rotation {
    x: 0.0
    y: 0.70710677
    z: 0.0
    w: 0.70710677
  }
}
