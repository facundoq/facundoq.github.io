# First install:
# Julia
# Markdown
# Pandoc

type MDFile
  key::AbstractString
  title::AbstractString
end

function generate(mdfile::MDFile)
  key=mdfile.key
  title=mdfile.title

  html="$key.html"
  md="$key.md"
  #output=readall(`pandoc --from markdown_github --to html -c style.css --standalone $(mdfile.key).md `)
  text = readall(`pandoc --from markdown_github --to html -c style.css --standalone $md`)
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

hasext(p::AbstractString,ext::AbstractString)= splitext(p)[2] ==".$ext"

files=filter(x->hasext(x,"md"), readdir("."))
toMDFile(p::AbstractString)= MDFile(splitext(p)[1],splitext(p)[1])
mdfiles=map(toMDFile,files)


for i=1:length(mdfiles)
  println(" ($i) Watching file $(mdfiles[i].key).md")
  @async watch_and_generate(mdfiles[i])
end

while true
  sleep(1)
end
