#https://cran.r-project.org/web/packages/pals/pals.pdf
#https://cran.r-project.org/web/packages/pals/vignettes/pals_examples.html

makeDf = function(pal, group){
  return(data.frame(pal, group))
}

firstUp <- function(x) {
  substr(x, 1, 1) = toupper(substr(x, 1, 1))
  return(x)
}


palOut = '../pals'
palInfo = read.csv("pals_info.csv", stringsAsFactors = F)
colnames(palInfo)
groups = unique(palInfo$group)

for(g in 1:length(groups)){
  print(groups[g])
  these = which(palInfo$group == groups[g])
  lines = vector()
  for(r in 1:length(these)){
    hex = eval(parse(text=paste0(palInfo[these[r],1],'(n=7)')))
    hex = paste0("\'",paste(hex, collapse="\', "),"\'")
    lines = c(lines, paste0(palInfo[these[r],4],': {7:{[',hex,']}'))
    
  }
  lines = paste(lines, collapse = ',\n')
  cat(lines)
  cat('\n\n\n')
}


for(i in 1:nrow(palInfo)){
  outFile = paste0(palOut,'/',palInfo$jsName[i],'.png')
  png(outFile, height = 3, width = 2.75, units = 'in', res=300)
  eval(parse(text=paste0('pal.bands(',palInfo$palName[i],', n=10000, labels="")')))
  dev.off()
}


files = list.files(palOut, '.png', full.names=T)
length(files)
for(i in 1:length(files)){
  cmd = paste0('magick ',files[i],' -crop 417x25+263+403 +repage ',files[i])
  system(cmd)
}









