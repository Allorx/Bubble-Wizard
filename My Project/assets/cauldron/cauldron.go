components {
  id: "cauldron"
  component: "/assets/cauldron/cauldron.script"
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
components {
  id: "soup"
  component: "/assets/cauldron/soup.particlefx"
  position {
    x: 0.0
    y: 3.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
components {
  id: "soup1"
  component: "/assets/cauldron/soup.particlefx"
  position {
    x: 0.0
    y: 3.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.70710677
    z: 0.0
    w: 0.70710677
  }
}
embedded_components {
  id: "model"
  type: "model"
  data: "mesh: \"/assets/cauldron/cauldron.dae\"\n"
  "material: \"/assets/shaders/lit.material\"\n"
  "textures: \"/assets/cauldron/Cauldron_base.png\"\n"
  "skeleton: \"\"\n"
  "animations: \"\"\n"
  "default_animation: \"\"\n"
  "name: \"unnamed\"\n"
  ""
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
