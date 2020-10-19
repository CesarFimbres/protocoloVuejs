var url = "db/crud.php";
sessionStorage.setItem("idTablero", 23);

var app = new Vue({
	el: "#app",
	data: {
		tableros: [],
		idTablero: sessionStorage.getItem("idTablero"),
		nombre: "",
		cliente: "",
		proyecto: "",
		busca: "",
		total: 0,
	},
	methods: {
		//*BOTONES Aca se declran las funciones que se activan al presionar los diferentes botnoes
		// btnAlta: async function () {
		// 	const { value: formValues } = await Swal.fire({
		// 		title: "Nuevo registro",
		// 		html:
		// 			'<div class="row"><label class="col-sm-3 col-form-label">Nombre</label>  <div class="col-sm-7"><input id="nombre" type="text" class="form-control"></div>  </div>  <div class="row"><label class="col-sm-3 col-form-label">Clietne</label>  <div class="col-sm-7"><input id="cliente" type="text" class="form-control"></div>  </div>  <div class="row"><label class="col-sm-3 col-form-label">Proyecto</label>  <div class="col-sm-7"><input id="proyecto" type="text" class="form-control"></div>  </div>',
		// 		focusConfirm: false,
		// 		showCancelButton: true,
		// 		confirmButtonText: "Guardar",
		// 		confirmButtonColor: "#1a237e",
		// 		cancelButtonColor: "#039be5",
		// 		preConfirm: () => {
		// 			return [
		// 				(this.nombre = document.getElementById("nombre").value),
		// 				(this.cliente = document.getElementById("cliente").value),
		// 				(this.proyecto = document.getElementById("proyecto").value),
		// 			];
		// 		},
		// 	});
		// 	if (this.nombre == "" || this.cliente == "" || this.proyecto == "") {
		// 		Swal.fire("Datos incompletos", "Intentalo de nuevo", "question");
		// 	} else {
		// 		this.altaTablero();
		// 		const Toast = Swal.mixin({
		// 			toast: true,
		// 			position: "top-end",
		// 			showConfirmButton: false,
		// 			timer: 3000,
		// 			timerProgressBar: true,
		// 			didOpen: (toast) => {
		// 				toast.addEventListener("mouseenter", Swal.stopTimer);
		// 				toast.addEventListener("mouseleave", Swal.resumeTimer);
		// 			},
		// 		});
		// 		Toast.fire({
		// 			icon: "success",
		// 			title: "Registrado correctamente",
		// 		});
		// 	}
		// },
		// btnEditar: async function (id, nombre, cliente, proyecto) {
		// 	await Swal.fire({
		// 		title: "EDITAR",
		// 		html:
		// 			'<div class="form-group">  <div class="row"><label class="col-sm-3 col-form-label">Nombre</label>  <div class="col-sm-7"><input id="nombre" value="' +
		// 			nombre +
		// 			'" type="text" class="form-control"></div>  </div>  <div class="row"><label class="col-sm-3 col-form-label">Cliente</label>  <div class="col-sm-7"><input id="cliente" value="' +
		// 			cliente +
		// 			'" type="text" class="form-control"></div>  </div>  <div class="row"><label class="col-sm-3 col-form-label">Proyecto</label>  <div class="col-sm-7"><input id="proyecto" value="' +
		// 			proyecto +
		// 			'" type="text" class="form-control">  </div>  </div>  </div>',
		// 		focusConfirm: false,
		// 		showCancelButton: true,
		// 	}).then((result) => {
		// 		if (result.value) {
		// 			(nombre = document.getElementById("nombre").value),
		// 				(cliente = document.getElementById("cliente").value),
		// 				(proyecto = document.getElementById("proyecto").value),
		// 				this.editarTablero(id, nombre, cliente, proyecto);
		// 			Swal.fire("¡Actualizado!", "El registro ha sido actualizado.", "success");
		// 		}
		// 	});
		// },
		// btnBorrar: function (id, nombre, cliente) {
		// 	Swal.fire({
		// 		title:
		// 			"¿Está seguro de borrar el registro: " +
		// 			id +
		// 			"- " +
		// 			cliente +
		// 			" " +
		// 			nombre +
		// 			"?",
		// 		type: "warning",
		// 		showCancelButton: true,
		// 		confirmButtonColor: "#d33",
		// 		cancelButtonColor: "#3085d6",
		// 		confirmButtonText: "Borrar",
		// 	}).then((result) => {
		// 		if (result.value) {
		// 			this.borrarTablero(id);
		// 			Swal.fire("¡Eliminado!", "El registro ha sido borrado.", "success");
		// 		}
		// 	});
		// },
		btnAltaInspeccion: async function () {
			Swal.fire({
				icon: "question",
				title: "¿Deseas registrar el formulario?",
				showCancelButton: true,
				confirmButtonColor: "#b30903",
				cancelButtonColor: "#212121",
				confirmButtonText: "Guardar",
			}).then((result) => {
				if (result.value) {
					//Llama funcion para guardar resultado del cuestionario
					console.log("Saludos desde btnAltaInspeccion");
					this.altaInspeccion();
				}
			});
		},

		btnRepo: function (id, nombre, proyecto) {
			Swal.fire({
				icon: "question",
				title:
					"¿Desea obtener el protocolo\n " + id + "- " + nombre + " de " + proyecto + "?",
				showCancelButton: true,
				confirmButtonColor: "#b30903",
				cancelButtonColor: "#212121",
				confirmButtonText: "Generar reporte",
			}).then((result) => {
				if (result.value) {
					// Llamar reporte y enviar el valor del idProtocolo
					sessionStorage.setItem("idTablero", id);
					window.open(
						"verReporte.html",
						"Visualiando protocolo",
						"width=745, height=987"
					);
				}
			});
		},
		//*PROCEDIMIENTOS aqui estan las funciones que envian parametros para realiar el crud
		//Procedimiento READ o consultar

		//  altaTablero: function () {
		// 	axios
		// 		.post(url, {
		// 			option: 1,
		// 			nombre: this.nombre,
		// 			cliente: this.cliente,
		// 			proyecto: this.proyecto,
		// 		})
		// 		.then((response) => {
		// 			this.listarTableros();
		// 		});
		// 		(this.nombre = ""), (this.cliente = ""), (this.proyecto = "");
		// },

		//Procedimiento para almacenar los resultados de formulario Inspeccion.
		altaInspeccion: function () {
			console.log("Saludos desde altaInspeccion()");
			const data = this.getData();

			let inspeccionData = {
				option: 6,
				idTablero: this.idTablero,
				data,
			};
			console.log(inspeccionData);
			axios.post("db/ej_axios.php", inspeccionData).then((response) => {
				console.log(response);
			});
			this.idTablero = "";
		},

		//Procedimiento para obtener los datos de algun formulario
		getData: function () {
			console.log("Saludos desde getData");
			const textes = document.querySelectorAll('input[type="text"]');
			const checkboxes = document.querySelectorAll('input[type="checkbox"]');

			let check = {};
			let text = {};
			let preg = "";
			let resp = "";

			textes.forEach((elemnet, index) => {
				preg = textes[index].id;
				resp = textes[index].value;
				text[preg] = `${resp}`;
			});

			checkboxes.forEach((elemnet, index) => {
				preg = checkboxes[index].id;
				resp = checkboxes[index].checked;
				check[preg] = `${resp}`;
			});

			// let objData = { data: { checkbox: [check], textbox: [text] } };
			let objData = {
				checkbox: check,
				textbox: text,
			};

			//  return objData;
			return JSON.stringify(objData);
		},

		listarTableros: function () {
			axios.post(url, { option: 4 }).then((response) => {
				this.tableros = response.data;
			});
		},
		//Procedimiento SEARCH o encontrar
		encuentraTablero: function () {
			axios.post(url, { option: 5, busca: this.busca }).then((response) => {
				this.tableros = response.data;
			});
		},
		//Procedimiento CREATE o insertar.
		// altaTablero: function () {
		// 	axios
		// 		.post(url, {
		// 			option: 1,
		// 			nombre: this.nombre,
		// 			cliente: this.cliente,
		// 			proyecto: this.proyecto,
		// 		})
		// 		.then((response) => {
		// 			this.listarTableros();
		// 		});
		// 		(this.nombre = ""), (this.cliente = ""), (this.proyecto = "");
		// },
		// //Procedimiento EDIT o editar.
		// editarTablero: function (id, nombre, cliente, proyecto) {
		// 	axios
		// 		.post(url, {
		// 			option: 2,
		// 			id: id,
		// 			nombre: nombre,
		// 			cliente: cliente,
		// 			proyecto: proyecto,
		// 		})
		// 		.then((response) => {
		// 			this.listarTableros();
		// 		});
		// },
		// //Procedimiento DELETE o borrar.
		// borrarTablero: function (id) {
		// 	axios.post(url, { option: 3, id: id }).then((response) => {
		// 		this.listarTableros();
		// 	});
		// },
	},
	created: function () {
		this.listarTableros();
	},
	computed: {
		totalStock() {
			this.total = 0;
			for (tablero of this.tableros) {
				this.total = this.total + parseInt(tablero.proyecto);
			}
			return this.total;
		},
	},
});
