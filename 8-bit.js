document.addEventListener("DOMContentLoaded", async () => {

  const canvas = document.getElementById('canvas')
  const context = canvas.getContext('2d')

  const imports = {
    callbacks: { draw },
  }  

  let game = await WebAssembly.instantiateStreaming(fetch('8-bit.wasm'), imports)
  let mem = new Uint8Array(game.instance.exports.memory.buffer)

  game.instance.exports.fill(255, 127, 12, 100)
  
  function draw() {
    const bitmap = new Uint8ClampedArray(mem.slice(0, 256000))

    const imageData = new ImageData(bitmap, 320, 200)
    context.putImageData(imageData, 0, 0)
  }
})
