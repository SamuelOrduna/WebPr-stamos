using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Web_EF {
  public partial class AdminAvalan : System.Web.UI.Page {
    
    //Esta clase sirve para mostrar cómo hacer actualizaciones a una tabla de una base de datos
    // (en este caso: Avalan) utilizando Entity Framework desde una aplicación Web.
    // Se muestran las operaciones de inserción y borrado; la de cambio se deja, opcionalmente,
    // como ejercicio para el estudiante.

    //Variables de clase.
    PréstamosEntities context = new PréstamosEntities();
    List<Préstamos> lsPréstamos; List<Avalan> lsAvalan; List<Avales> lsAvales;
    Clientes cliente; Avales aval; Avalan av;
    string cadSql, rfc; 
    private int folio, idAval;

    int índiceFila;
    int índiceFolio = 2, índiceIdAval = 3;    //NOTA: Estos valores deben ajustarse si se agregan
                                              //más columnas a GrdAvalan.
    GridViewRow g;                            //Para obtener (como objeto) una fila del grid.

    //Acciones iniciales.
    protected void Page_Load(object sender, EventArgs e) {

      cargaGrid();
      Response.Write("Llené grid");     //De esta manera se pueden escribir mensajes en la página.
    }

    //Carga el grid con el contenido actual de la tabla Avalan.
    public void cargaGrid() {

    }

    //Activa los controles que corresponda.
    public void activaControles() {
      BtnAlta.Enabled = false; BtnBaja.Enabled = false;
      btnMuestraAval.Enabled = false;
      DdlPréstamos.Visible = true; DdlAvales.Visible = true;
      TxtMonto.Visible = true; BtnEjecutar.Visible = true;
      Label2.Visible = true; Label3.Visible = true; Label4.Visible = true;
    }

    //Desactiva los controles que corresponda.
    public void desactivaControles() {
      BtnAlta.Enabled = true; BtnBaja.Enabled = true;
      btnMuestraAval.Enabled = true;
      GrdAvales.Visible = false; btnOcultaAval.Visible = false;
      GrdAvalan.Enabled = false; DdlPréstamos.Visible = false;
      DdlAvales.Visible = false; DdlAvales.Enabled = false;
      TxtMonto.Visible = false; TxtMonto.Enabled = false;
      BtnEjecutar.Visible = false;
      Label2.Visible = false; Label3.Visible = false; Label4.Visible = false;
    }

    //========================================================================
    //Parte 1a: acciones relacionadas con el alta de avales-préstamos.

    protected void BtnAlta_Click(object sender, EventArgs e) {

      //Recupera objetos de Session.
      cliente = (Clientes) Session["cliente"];
      rfc = cliente.Rfc;

      //Muestra/deshabilita los controles asociados al alta.
      activaControles();

      //Carga el folio de los préstamos del cliente.

      //Carga el nombre de los avales.

      //Indica la operación actual.
      LblMensaje.Text = "Operación: Alta";
      Session["Operación"] = "Alta";
    }

    //Habilita al ddl de avales.
    protected void DdlPréstamos_SelectedIndexChanged(object sender, EventArgs e) {

      DdlAvales.Enabled = true;
    }

    //Habilita la caja del monto y el botón de ejecutar.
    protected void DdlAvales_SelectedIndexChanged(object sender, EventArgs e) {

      TxtMonto.Enabled = true; BtnEjecutar.Enabled = true;
    }

    //Parte 1.b: Termina de hacer el alta en la tabla: Avalan.
    public void alta() {

      //Recupera la clave del aval seleccionado.

      //Si el monto es mayor o igual al mínimo requerido, hace el alta.
      if (Convert.ToInt32(TxtMonto.Text) >= 50000) {

      }
      else {
        LblMensaje.Text = "Error: el monto mínimo debe ser 50000";
        TxtMonto.Focus();
      }
    }

    //Parte 2: elimina un vínculo Préstamo-Aval.
    protected void BtnBaja_Click(object sender, EventArgs e) {

    }

    //Elimina la tupla elegida de Avalan cuando se da clic en el botón de la fila en el grid.
    protected void GrdAvalan_RowDeleting(object sender, GridViewDeleteEventArgs e) {

    }

    //Parte 4: Ejecuta la operación.
    protected void BtnEjecuta_Click(object sender, EventArgs e) {
      string oper;

      oper = Session["Operación"].ToString();
      switch (oper) {
        case "Alta":
          alta();
          break;
        case "Cambio":
          //cambio();
          break;
      }
    }

    //Inicia el proceso de muestra de los datos del aval de la fila elegida en el grid.
    protected void btnMuestraAval_Click(object sender, EventArgs e) {
      BtnAlta.Enabled = false; BtnBaja.Enabled = false;
      btnMuestraAval.Enabled = false; btnOcultaAval.Visible = true;
      GrdAvalan.Enabled = true; GrdAvales.Visible = true;
    }

    //Código asociado al botón de Seleccionar.
    //Al elegir una tupla, muestra todos los datos del aval que está en la misma.
    protected void GrdAvalan_SelectedIndexChanged(object sender, EventArgs e) {
      int idAval;

      índiceFila = GrdAvalan.SelectedIndex;      //Obtiene el índice de la fila seleccionada.

      //Obtiene la clave del aval.
      g = GrdAvalan.Rows[índiceFila];      //Obtiene la fila seleccionada.
      idAval = Convert.ToInt16(g.Cells[índiceIdAval].Text);	//Luego la clave del aval.

      //Obtiene los datos del aval y los muestra.

    }

    //Termina el proceso de muestra de los datos del aval de la fila elegida en el grid.
    protected void btnOcultaAval_Click(object sender, EventArgs e) {
      BtnAlta.Enabled = true; BtnBaja.Enabled = true;
      btnMuestraAval.Enabled = true; btnOcultaAval.Visible = false;
      GrdAvalan.Enabled = false; GrdAvales.Visible = false;
    }




  }
}
