document.addEventListener("DOMContentLoaded", function(){
  const c = document.getElementById("mycanvas");
  c.height = 500;
  c.width = 500;

  const ctx = c.getContext("2d");
  ctx.fillStyle = "red";
  ctx.fillRect(0,0,500,500);

  ctx.beginPath();
  ctx.arc(100, 200, 40, 0 , Math.PI);
  ctx.strokeStyle = "blue";
  ctx.lineWidth = 10;
  ctx.stroke();
  ctx.fillStyle = "green";
  ctx.fill();

  ctx.beginPath();
  ctx.arc(100, 100, 40, 0 , Math.PI);
  ctx.strokeStyle = "blue";
  ctx.lineWidth = 10;
  ctx.stroke();
  ctx.fillStyle = "green";
  ctx.fill();

});
