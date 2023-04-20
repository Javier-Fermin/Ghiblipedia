replace node
doc(
  "ghiblipedia.xml"
)/ghiblipedia/films/film[@id="F03"]/streamingPlatforms
with 
<streamingPlatforms>
<name>HBO Max</name>
<name>Pocoyo</name>
</streamingPlatforms>,

replace value of node
doc(
  "ghiblipedia.xml"
)/ghiblipedia/films/film[@id="F03"]/ratings
with 4,
replace value of node
doc(
  "ghiblipedia.xml"
)/ghiblipedia/films/film[@id="F03"]/views
with 1000000000000000000