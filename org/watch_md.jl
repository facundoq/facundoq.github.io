
type MDFile
  key::AbstractString
  title::AbstractString
end

function generate(mdfile::MDFile)
  key=mdfile.key
  title=mdfile.title

  html="$key.html"
  md="$key.md"
  text = readall(`markdown $(md)`)
  template = readall("template.html")
  output=template
  output=replace(output,"#title",title)
  output=replace(output,"#body",text)
  open(html,"w") do f
      print(f, output)
  end
end

function watch_and_generate(mdfile::MDFile)
  while true
    println("Generating $(mdfile.key).html")
    generate(mdfile)
    watch_file("$(mdfile.key).md",100)
  end
end

files=[MDFile("videos", "Videos de organización de computadoras"),
        MDFile("ejercicios", "Ejercicios de organización de computadoras") ]

for i=1:length(files)
  println(" ($i) Watching file $(files[i].key)")
  @async watch_and_generate(files[i])
end

while true
  sleep(1)
end
