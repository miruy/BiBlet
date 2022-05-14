module.exports = {
  mode: "jit",
  content: ["./src/main/webapp/views/**/*.jsp"],
  theme: {
    extend: {},
  },
  daisyui: {
    themes: [
      {
        blueTheme: {
          "primary": "#fef08a",
          "secondary": "#bfdbfe",
          "accent": "#bae6fd",
          "neutral": "#e0f2fe",
          "base-100": "white",
          "info": "#1e40af",
          "success": "#2563eb",
          "warning": "#4f46e5",
          "error": "#312e81",
          "ghost": "#e0e7ff",
        },
      },
    ],
  },
  plugins: [require("daisyui")],
}
