function clearFields() {
    const x = document.getElementsByClassName("input_data");
    for (let i = 0; i < x.length; i++) {
        x[i].value = "";
    }
}
window.onload = clearFields;