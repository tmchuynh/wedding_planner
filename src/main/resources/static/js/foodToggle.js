function toggleView() {
	const tableView = document.getElementById("table-view");
	const gridView = document.getElementById("grid-view");

	if (tableView.style.display === "none") {
		tableView.style.display = "table";
		gridView.style.display = "none";
	} else {
		tableView.style.display = "none";
		gridView.style.display = "grid";
	}
}