module Color
	COLORS = {
		black: "#000000",
		white: "#ffffff",
		red: "#ff0000",
		green: "#00ff00",
		blue: "#0000ff",
		yellow: "#ffff00",
		cyan: "#00ffff",
		magenta: "#ff00ff",

		gray: "#808080",
		grey: "#808080",
		dark_gray: "#404040",
		light_gray: "#c0c0c0",

		maroon: "#800000",
		olive: "#808000",
		lime: "#00ff00",
		teal: "#008080",
		navy: "#000080",
		purple: "#800080",
		silver: "#c0c0c0",
		aqua: "#00ffff",
		fuchsia: "#ff00ff",

		tomato: "#ff6347",
		salmon: "#fa8072",
		coral: "#ff7f50",
		crimson: "#dc143c",
		pink: "#ffc0cb",
		hot_pink: "#ff69b4",
		deep_pink: "#ff1493",
		rose: "#ff007f",
		burgundy: "#800020",

		orange: "#ffa500",
		dark_orange: "#ff8c00",
		gold: "#ffd700",
		goldenrod: "#daa520",
		khaki: "#f0e68c",
		beige: "#f5f5dc",
		wheat: "#f5deb3",
		peach: "#ffdab9",

		lavender: "#e6e6fa",
		violet: "#ee82ee",
		indigo: "#4b0082",
		plum: "#dda0dd",
		orchid: "#da70d6",
		amethyst: "#9966cc",
		eggplant: "#614051",
		mauve: "#e0b0ff",

		sky_blue: "#87ceeb",
		light_blue: "#add8e6",
		deep_sky_blue: "#00bfff",
		dodger_blue: "#1e90ff",
		royal_blue: "#4169e1",
		steel_blue: "#4682b4",
		cornflower_blue: "#6495ed",
		powder_blue: "#b0e0e6",
		baby_blue: "#89cff0",
		ice_blue: "#dff6ff",
		dark_blue: "#00008b",
		midnight_blue: "#191970",
		prussian_blue: "#003153",
		cobalt_blue: "#0047ab",
		azure: "#007fff",
		cerulean: "#007ba7",

		forest_green: "#228b22",
		dark_green: "#006400",
		lime_green: "#32cd32",
		spring_green: "#00ff7f",
		sea_green: "#2e8b57",
		medium_sea_green: "#3cb371",
		olive_drab: "#6b8e23",
		mint: "#98ff98",
		mint_green: "#98fb98",
		jade: "#00a86b",
		turquoise: "#40e0d0",
		aquamarine: "#7fffd4",
		teal_blue: "#367588",
		seafoam: "#93e9be",
		emerald: "#50c878",

		brown: "#a52a2a",
		saddle_brown: "#8b4513",
		chocolate: "#d2691e",
		sienna: "#a0522d",
		rust: "#b7410e",
		copper: "#b87333",
		bronze: "#cd7f32",
		tan: "#d2b48c",
		caramel: "#af6f09",

		ivory: "#fffff0",
		cream: "#fffdd0",
		snow: "#fffafa",
		alice_blue: "#f0f8ff",
		ghost_white: "#f8f8ff",
		floral_white: "#fffaf0",
		honeydew: "#f0fff0",
		mint_cream: "#f5fffa",
		azure_white: "#f0ffff",

		dark_red: "#8b0000",
		firebrick: "#b22222",
		indian_red: "#cd5c5c",
		dark_salmon: "#e9967a",
		light_salmon: "#ffa07a",

		dark_violet: "#9400d3",
		dark_magenta: "#8b008b",
		medium_purple: "#9370db",
		medium_orchid: "#ba55d3",
		rebecca_purple: "#663399",

		chartreuse: "#7fff00",
		yellow_green: "#9acd32",
		dark_khaki: "#bdb76b",
		lemon: "#fff44f",
		canary: "#ffef00"
	}

	def self.hex(texto, hex)
		hex = hex.delete("#")

		raise ArgumentError, "cor hexadecimal inválida" unless hex.match?(/\A[0-9a-fA-F]{6}\z/)

		r = hex[0..1].to_i(16)
		g = hex[2..3].to_i(16)
		b = hex[4..5].to_i(16)

		"\e[38;2;#{r};#{g};#{b}m#{texto}\e[0m"
	end

	COLORS.each do |nome, hex|
		define_singleton_method(nome) do |texto|
			Color.hex(texto, hex)
		end
	end
end
