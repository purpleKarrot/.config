function cbhs --description 'Copy most recent command in history to a clipboard'
	history | head -n 1 | cb
end
