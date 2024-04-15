using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;

namespace WebPréstamos.EF {
  public partial class WebListaPréstamos : System.Web.UI.Page {
    //Variables de clase.
    PréstamosEntities context = new PréstamosEntities();
    Clientes cliente; string cadSql; Préstamos préstamo;
    List<Préstamos> lsPréstamos; List<Pagos> lsPagos; List<Avales> lsAvales;
    List<PréstPagos> lsPréstPagos;

    //Clase temporal para guardar campos de más de una tabla.
    public class PréstPagos {
      public int Folio {get; set;}
      public decimal Mensualidad { get; set; }
      public DateTime Fecha { get; set; }
      public decimal MontoPago { get; set; }
    }

    //Acciones iniciales.
    protected void Page_Load(object sender, EventArgs e) {

      if (!IsPostBack) {
        //Recupera objetos desde Session.
        cliente = (Clientes) Session["Cliente"];

        //Muestra los datos del cliente.
        TblCliente.Rows[1].Cells[0].Text = cliente.Rfc;
        TblCliente.Rows[1].Cells[1].Text = cliente.Nombre;
        TblCliente.Rows[1].Cells[2].Text = cliente.Domicilio;

        //Lee sus préstamos.
        cadSql = $"select * from Préstamos where Rfc= '{cliente.Rfc}'";
        lsPréstamos = context.Préstamos.SqlQuery(cadSql).ToList();

        //Carga los folios en el DDL.
        DdlPréstamos.Items.Add(" ");
        foreach (Préstamos p in lsPréstamos)
          DdlPréstamos.Items.Add(p.Folio.ToString());
      }
    }
    //Muestra datos asociados al préstamo elegido en el DDL.
    protected void DdlPréstamos_SelectedIndexChanged(object sender, EventArgs e) {
      if (DdlPréstamos.Text != " ") {

        //Busca el préstamos en la BD por medio de su folio.
        cadSql = $"select * from Préstamos where Folio= {DdlPréstamos.Text}";
        lsPréstamos = context.Préstamos.SqlQuery(cadSql).ToList();

        //Muestra los datos en la tabla.
        préstamo = lsPréstamos[0];
        TblPréstamo.Rows[1].Cells[0].Text = préstamo.Folio.ToString();
        TblPréstamo.Rows[1].Cells[1].Text = préstamo.Monto.ToString();
        TblPréstamo.Rows[1].Cells[2].Text = préstamo.Mensualidad.ToString();
        TblPréstamo.Rows[1].Cells[3].Text = préstamo.Saldo.ToString();

        //Muestra los datos de los pagos del préstamo.
        cadSql = $"select * from Pagos where Folio= {préstamo.Folio}";
        lsPagos = context.Pagos.SqlQuery(cadSql).ToList();
        GrdPagos.DataSource = lsPagos;
        GrdPagos.DataBind();

        //Muestra los datos de los avales.
        cadSql = $"select * from avalan av, avales a " +
          $"where Folio= {préstamo.Folio} and av.IdAval=a.IdAval";
        lsAvales = context.Avales.SqlQuery(cadSql).ToList();
        GrdAvales.DataSource = lsAvales;
        GrdAvales.DataBind();

        //Muestra campos de más de una tabla.
        cadSql = $"select p.Folio, Mensualidad, pa.Fecha, MontoPago "+
          $"from Préstamos p, Pagos pa " +
          $"where p.Folio=pa.Folio and p.Folio= {préstamo.Folio}";
        lsPréstPagos = context.Database.SqlQuery<PréstPagos>(cadSql).ToList();
        GrdPréstPagos.DataSource = lsPréstPagos;
        GrdPréstPagos.DataBind();
      }
    }
  }
}









