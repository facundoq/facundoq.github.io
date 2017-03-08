# First install:
# Julia
# Markdown
# Pandoc

type MDFile
  key::AbstractString
  title::AbstractString
end

function title_from_markdown(filepath::AbstractString)
  result=""
  open(filepath) do f
    for line in eachline(f)
        line=strip(line)
        if length(line)>1 && line[1]=='#' && line[2]!='#'
          result=line[2:end]
          break
        end
    end
  end
  return result
end

function generate(mdfile::MDFile)
  key=mdfile.key
  title=mdfile.title

  html="$key.html"
  md="$key.md"

  md_text=readall(md);

  title=title_from_markdown(md)
  # template = readall("template.html")
  # output=template
  # output=replace(output,"#title",title)
  # output=replace(output,"#body",text)

  text = readall(`pandoc --from markdown_github --to html -c style.css -T $title --standalone $md`)
  open(html,"w") do f
      print(f, text)
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
