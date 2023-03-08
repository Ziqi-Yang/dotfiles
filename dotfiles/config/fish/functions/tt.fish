# translate things using chatgpt
function tt -a "origin"
		source ~/.config/fish/functions/gfw.fish
		gfw sgpt "Can you facilitate the translation of the given items between English and Simplified Chinese? '$origin'?"
end
