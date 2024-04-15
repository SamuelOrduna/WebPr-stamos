using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;

namespace WebPréstamos {
  public partial class Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {

    }
    //Variables de clase.
    PréstamosEntities context = new PréstamosEntities();

    //Verificar que usuario y contraseña coinciden
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e) {
      List<Clientes> lsClientes;
      string cadSql;

      //Definición de la consulta.
      cadSql = $"select * from Clientes where Rfc='{Login1.UserName}' " +
        $"and Contraseña='{Login1.Password}'";

      //Ejecuta la consulta.
      lsClientes = context.Clientes.SqlQuery(cadSql).ToList();
      if (lsClientes.Count != 0) {
        Session["Cliente"] = lsClientes[0];
        Server.Transfer("EF/AdminAvalan.aspx");
      }

    }
  }
}