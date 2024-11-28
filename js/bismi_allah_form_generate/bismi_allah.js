// بسم الله الرحمن الرحيم
// la ilaha illa Allah Mohammed rassoul Allah

console.log("بسم الله الرحمن الرحيم")

const MAX_INTERVALS = 20;
const MAX_ROWS = 200;
let intervals_count = 5;
let bismi_allah_table = document.getElementById('bismi_allah');
let menu = document.getElementById('bismi_allah_floating_menu');
let selected_row = null;

function showMenu(event) {
    // Set the position of the menu near the clicked row
    menu.style.left = `${event.pageX}px`;
    menu.style.top = `${event.pageY}px`;

    if(selected_row) selected_row.classList.remove("tr-selected");
    selected_row = this;

    // Display the menu
    menu.style.display = 'block';
    selected_row.classList.add("tr-selected");
}

function hideMenu() {
    selected_row.classList.remove("tr-selected");
    menu.style.display = 'none';
    selected_row = null;
}

document.getElementById('bismi_allah_menu_button_insert').onclick = function() {
    bismi_allah_table.insertBefore(trSessions(), selected_row.nextSibling);
}

document.getElementById('bismi_allah_menu_button_delete').onclick = function() {
    selected_row.remove();
    hideMenu();
}

document.addEventListener('click', function(event) {
    menu = document.getElementById('bismi_allah_floating_menu');
    const isClickInsideMenu = menu.contains(event.target);
    const isClickOnRow = event.target.closest("tr");

    // Hide the menu if clicking outside of it or another row
    if (!isClickInsideMenu && !isClickOnRow) {
        hideMenu();
    }
    document.querySelectorAll("#bismi_allah_tr_selected").id = '';
});

function tdSession(title_value = '', text_value = '') {
    let td = document.createElement('td');
    let input_title = document.createElement('input');
    input_title.value = title_value;
    td.appendChild(input_title);
    let input_text = document.createElement('input');
    input_text.value = text_value;
    td.appendChild(input_text);
    return td;
}

function tdRowName(name = '') {
    let td = document.createElement('td');
    let input = document.createElement('input');
    input.value = name;
    td.appendChild(input);
    return td;
}

function trSessions() {
    let tr = document.createElement('tr');
    tr.onclick = showMenu;
    tr.appendChild(tdRowName());
    for (let i = 0; i < intervals_count; i++) tr.appendChild(tdSession());
    return tr;
}

function thInterval(value = '') {
    let th = document.createElement('th');
    let input = document.createElement('input');
    input.value = value;
    th.appendChild(input);
    return th;
}

function trIntervals() {
    let tr = document.createElement('tr');
    tr.onclick = showMenu;
    tr.appendChild(document.createElement('th'));
    for (let i = 0; i < intervals_count; i++) {
        tr.appendChild(thInterval())
    }
    return tr;
}

function setInputNames() {
    let sub_idz_index = 0;
    let sub_idz_row_index = 0;
    for (const tr of bismi_allah_table.children) {
        switch (tr.children[0].tagName) {
            case 'TH':
                sub_idz_index += 1;
                sub_idz_row_index = 0;
                for (const th of [...tr.children].slice(1)) {
                    th.children[0].name = "idz_data[" + sub_idz_index + "][intervals][]";
                }
                break;
            case 'TD':
                tr.children[0].children[0].name = "idz_data[" + sub_idz_index + "][rows][" + sub_idz_row_index + "][name]";
                for (const [i, td] of [...tr.children].slice(1).entries()) {
                    td.children[0].name = "idz_data[" + sub_idz_index + "][rows][" + sub_idz_row_index + "][sessions][" + i + "][title]";
                    td.children[1].name = "idz_data[" + sub_idz_index + "][rows][" + sub_idz_row_index + "][sessions][" + i + "][text]";
                }
                sub_idz_row_index += 1;
                break;
        }
    }
}

document.getElementById("bismi_allah_new_intervals").onclick = function() {
    bismi_allah_table.appendChild(trIntervals());
}

bismi_allah_table.appendChild(trIntervals());
bismi_allah_table.appendChild(trSessions());
bismi_allah_table.appendChild(trSessions());
bismi_allah_table.appendChild(trSessions());

bismi_allah_table.appendChild(trIntervals());
bismi_allah_table.appendChild(trSessions());
bismi_allah_table.appendChild(trSessions());
bismi_allah_table.appendChild(trSessions());

for(const tr of document.getElementsByTagName('TR')) tr.onclick = showMenu;

setInputNames();

