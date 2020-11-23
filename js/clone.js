var count = 2;

function addElement(param) {
	switch (param) {
		case "aislamiento":
			console.log(param);
			newSection = `
			<div class="parent mt-5">
				<div class="form-row">
					<div class="col-md-4 mb-3">
						<label for="seccionTablero">Seccion de tablero</label>
						<input type="text" class="form-control" id="seccionTablero-${count}" />
					</div>
					<div class="col-md-2 mb-3">
						<label for="N">N</label>
						<input type="text" class="form-control" id="N-${count}" placeholder="MΩ" />
					</div>
					<div class="col-md-2 mb-3">
						<label for="L1">L1</label>
						<input type="text" class="form-control" id="L1-${count}" placeholder="MΩ" />
					</div>
					<div class="col-md-2 mb-3">
						<label for="L2">L2</label>
						<input type="text" class="form-control" id="L2-${count}" placeholder="MΩ" />
					</div>
					<div class="col-md-2 mb-3">
						<label for="L3">L3</label>
						<input type="text" class="form-control" id="L3-${count}" placeholder="MΩ" />
					</div>
				</div>
			</div>
			`;
			break;
		case "hipot":
			console.log(param);
			newSection = `
			<div class="parent">
				<div class="form-row">
					<div class="col-md-4 mb-3">
						<label for="seccionTablero-${count}">Seccion de tablero</label>
						<input type="text" class="form-control" id="seccionTablero-${count}" value="" required>
						<div class="invalid-feedback">
							Ingrese seccion de tablero.
						</div>
					</div>
					<div class="col-md-2 mb-3">
						<label for="resistenciaN-${count}">N</label>
						<input type="text" class="form-control" id="resistenciaN-${count}" placeholder="MΩ" value="" required>
						<div class="invalid-feedback">
							Ingrese valor N.
						</div>
					</div>
					<div class="col-md-2 mb-3">
						<label for="resistenciaL1-${count}">L1</label>
						<input type="text" class="form-control" id="resistenciaL1-${count}" placeholder="MΩ" value="" required>
						<div class="invalid-feedback">
							Ingrese valor L1.
						</div>
					</div>
					<div class="col-md-2 mb-3">
						<label for="resistenciaL2-${count}">L2</label>
						<input type="text" class="form-control" id="resistenciaL2-${count}" placeholder="MΩ" value="" required>
						<div class="invalid-feedback">
							Ingrese valor L2.
						</div>
					</div>
					<div class="col-md-2 mb-3">
						<label for="resistenciaL3-${count}">L3</label>
						<input type="text" class="form-control" id="resistenciaL3-${count}" placeholder="MΩ" value="" required>
						<div class="invalid-feedback">
							Ingrese valor L3.
						</div>
					</div>
				</div>

				<!-- RENGLON DE VALORES DE VOLTAJE PARA HIPOT -->
				<div class="form-row">
					<div class="col-md-4 mb-3">

					</div>
					<div class="col-md-2 mb-3">
						<input type="text" class="form-control" id="voltajeN-${count}" placeholder="vN" value="" required>
						<div class="invalid-feedback">
							Ingrese valor N.
						</div>
					</div>
					<div class="col-md-2 mb-3">
						<input type="text" class="form-control" id="voltajeL1-${count}" placeholder="vL1" value="" required>
						<div class="invalid-feedback">
							Ingrese valor L1.
						</div>
					</div>
					<div class="col-md-2 mb-3">
						<input type="text" class="form-control" id="voltajeL2-${count}" placeholder="vL2" value="" required>
						<div class="invalid-feedback">
							Ingrese valor L2.
						</div>
					</div>
					<div class="col-md-2 mb-3">
						<input type="text" class="form-control" id="voltajeL3-${count}" placeholder="vL3" value="" required>
						<div class="invalid-feedback">
							Ingrese valor L3.
						</div>
					</div>
				</div>
				</div>
				`;
			break;

		default:
			console.log("Parametro no recibido...");
			break;
	}
	const childNode = document.querySelector("#newSection");
	childNode.insertAdjacentHTML("beforeend", newSection);
	count++;
}

function removeElement() {
	let lastDiv = document.querySelectorAll(".parent");
	if (lastDiv.length > 1) {
		lastDiv[lastDiv.length - 1].remove();
		count--;
	}
}

function addComment() {
	if (document.getElementById("newComment").hidden === true) {
		newComment = `
	<div class="container" id="compo">
		<hr class="mt-5">
		<h3 class="text-primary m-3">Comentarios</h3>
		<form>
			<div class="row">
				<div class="col-md-4 mt-1">
					<input id="responsable" type="text" class="form-control" placeholder="Responsables">
					</input>
				</div>
				<div class="col-md-4 mt-1">
					<textarea id="comentario" cols="10" rows="3" class="form-control"
						placeholder="Comentarios"></textarea>
				</div>
				<div class="col-md-4 mt-1">
					<textarea id="solucion" cols="10" rows="3" class="form-control"
						placeholder="Solución"></textarea>
				</div>
			</div>
		</form>
	</div>
		`;
		const newNode = document.querySelector("#newComment");
		newNode.insertAdjacentHTML("afterbegin", newComment);
		document.getElementById("newComment").hidden = false;
	} else {
		let dropComp = document.getElementById("compo");
		dropComp.remove();
		document.getElementById("newComment").hidden = true;
	}
}
