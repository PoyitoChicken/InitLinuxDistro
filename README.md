# initFedoraSec | ALFA VERSION COPY AT YOUR OWN RISK
Install DB and CyberSec dependencies for FedoraSec

## Process
1. Clone the repository  
```html
<button id="copyButton">Copy</button>
<script>
document.getElementById("copyButton").addEventListener("click", function() {
  const code = document.querySelector("git clone https://github.com/PoyitoChicken/initFedoraSec.git installers").innerText;
  navigator.clipboard.writeText(code).then(function() {
    alert("Code copied to clipboard!");
  }, function(err) {
    console.error("Error copying code to clipboard: ", err);
  });
});
</script>
```
2. Navigate to the folder
```html
<button id="copyButton">Copy</button>
<script>
document.getElementById("copyButton").addEventListener("click", function() {
  const code = document.querySelector("cd installers").innerText;
  navigator.clipboard.writeText(code).then(function() {
    alert("Code copied to clipboard!");
  }, function(err) {
    console.error("Error copying code to clipboard: ", err);
  });
});
</script>
```
3. Make it an executable file
```html
<button id="copyButton">Copy</button>
<script>
document.getElementById("copyButton").addEventListener("click", function() {
  const code = document.querySelector("chmod +x installer.sh").innerText;
  navigator.clipboard.writeText(code).then(function() {
    alert("Code copied to clipboard!");
  }, function(err) {
    console.error("Error copying code to clipboard: ", err);
  });
});
</script>
```
4. Run the installer
```html
<button id="copyButton">Copy</button>
<script>
document.getElementById("copyButton").addEventListener("click", function() {
  const code = document.querySelector("./installer").innerText;
  navigator.clipboard.writeText(code).then(function() {
    alert("Code copied to clipboard!");
  }, function(err) {
    console.error("Error copying code to clipboard: ", err);
  });
});
</script>
```