var url = "db/crud.php";
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
		btnSave: async function (p) {
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

					console.log(result.value);

					this.saveRegister(p);
				}
			});
		},

		btnComment: async function (p) {
			Swal.fire({
				icon: "question",
				title: "¿Deseas registrar los comentarios?",
				showCancelButton: true,
				confirmButtonColor: "#b30903",
				cancelButtonColor: "#212121",
				confirmButtonText: "Guardar",
			}).then((result) => {
				if (result.value) {
					//Llama funcion para guardar resultado del cuestionario
					this.saveComment(p);
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

		//Procedimiento para almacenar los resultados de formulario.
		saveRegister: function (p) {
			const data = this.getData();
			let dataRegister = {
				option: p,
				idTablero: this.idTablero,
				data,
			};
			axios.post(url, dataRegister).then((response) => {
				console.log(response.data);
				const Toast = Swal.mixin({
					toast: true,
					position: "top-end",
					showConfirmButton: false,
					timer: 3000,
					timerProgressBar: true,
					didOpen: (toast) => {
						toast.addEventListener("mouseenter", Swal.stopTimer);
						toast.addEventListener("mouseleave", Swal.resumeTimer);
					},
				});
				Toast.fire({
					icon: "success",
					title: "Registro almacenado correctamente!",
				});
			});
			//this.idTablero = "";
		},

		//Procedimiento para almacenar los comentarios de cada etapa del protocolo de pruebas (si los hay).
		saveComment: function (p) {
			const data = this.getComment(p);
			let dataRegister = {
				option: "comentarios",
				idTablero: this.idTablero,
				data,
			};

			console.log(dataRegister);

			axios.post(url, dataRegister).then((response) => {
				console.log(response.data);
				const Toast = Swal.mixin({
					toast: true,
					position: "top-end",
					showConfirmButton: false,
					timer: 3000,
					timerProgressBar: true,
					didOpen: (toast) => {
						toast.addEventListener("mouseenter", Swal.stopTimer);
						toast.addEventListener("mouseleave", Swal.resumeTimer);
					},
				});
				Toast.fire({
					icon: "success",
					title: "Registro almacenado correctamente!",
				});
			});
			this.idTablero = "";
		},

		//Procedimiento para obtener los datos de algun formulario
		getData: function () {
			const textes = document.querySelectorAll('input[type="text"]');
			const checkboxes = document.querySelectorAll('input[type="checkbox"]');
			const selectes = document.querySelectorAll("select");

			let check = {};
			let text = {};
			let select = {};

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

			selectes.forEach((elemnet, index) => {
				preg = selectes[index].id;
				resp = selectes[index].value;
				select[preg] = `${resp}`;
			});

			let objData = {
				checkbox: check,
				textbox: text,
				selectbox: select,
			};

			//  return objData;
			return JSON.stringify(objData);
		},
		// Procedimiento para obtener los comentarios del formulario de comentarios.
		getComment: function (p) {
			const domResponsable = document.getElementById("responsable").value;
			const domComentario = document.getElementById("comentario").value;
			const domSolucion = document.getElementById("solucion").value;
			const domEtapa = p;

			let comentario = {
				etapa: domEtapa,
				responsable: domResponsable,
				comentario: domComentario,
				solucion: domSolucion,
			};

			objData = {
				data: comentario,
			};

			return JSON.stringify(objData);
		},
		//Procedimiento para extraer los ultimos 7 tableros
		listarTableros: function () {
			axios.post(url, { option: "listar" }).then((response) => {
				this.tableros = response.data;
			});
		},
		//Procedimiento SEARCH o encontrar
		encuentraTablero: function () {
			axios.post(url, { option: "buscar", busca: this.busca }).then((response) => {
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
