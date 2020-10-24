document.addEventListener("DOMContentLoaded", async () => {

  const imports = {
    callbacks: {
      logAdd: (a, b, result) => console.log(`${a} + ${b} = ${result}`),
      logSubtract: (a, b, result) => console.log(`${a} - ${b} = ${result}`),
    },
  }

  let game = await WebAssembly.instantiateStreaming(fetch('8-bit.wasm'), imports)
  let x = game.instance.exports.add(42, 23)
  let y = game.instance.exports.subtract(42, 23)
})
