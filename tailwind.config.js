module.exports = {
  mode: "jit",
  content: ["./src/main/webapp/views/**/*.jsp"],
  theme: {
    extend: {},
  },
  daisyui: {
    themes: [
      {
        purpleTheme: {
            "primary": "#7e22ce",

            "secondary": "#c084fc",

            "accent": "#fef08a",

            "neutral": "#c4b5fd",

            "base-100": "#ffffff",

            "info": "#ffffff",
        },
      },
    ],
  },
  plugins: [require("daisyui")],
}
