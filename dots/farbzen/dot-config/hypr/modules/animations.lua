hl.curve("myBezier", {
  points = { { 0.05, 0.9 }, { 0.1, 1.0 } },
  type = "bezier",
})

hl.animation({
  bezier = "myBezier",
  enabled = true,
  leaf = "windows",
  speed = 4,
  spring = 4,
})
hl.animation({
  bezier = "default",
  enabled = true,
  leaf = "windowsOut",
  speed = 4,
  spring = 4,
  style = "popin 80%",
})
hl.animation({
  bezier = "default",
  enabled = true,
  leaf = "border",
  speed = 6,
  spring = 5,
})
hl.animation({
  bezier = "default",
  enabled = true,
  leaf = "borderangle",
  speed = 10,
  spring = 4,
})
hl.animation({
  bezier = "default",
  enabled = true,
  leaf = "fade",
  speed = 3,
  spring = 4,
})
hl.animation({
  bezier = "default",
  enabled = true,
  leaf = "workspaces",
  speed = 3,
  spring = 3,
  style = "slidefade 20%",
})
