﻿using invCruzRoja.Models;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace invCruzRoja.Reportes
{
    public partial class frmReporteActivosPorTerritorio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void generarReporte()
        {
            string rutaReporte = "~/Reportes/rptTerritoriosActivos.rdlc";
            string rutaServidor = Server.MapPath(rutaReporte);

            if (!File.Exists(rutaServidor))
            {
                this.lblResultado.Text = "El reporte seleccionado no existe";
            }
            else
            {
                rvActivosTerritorios.LocalReport.ReportPath = rutaServidor;
                var infoFuenteDatos = this.rvActivosTerritorios.LocalReport.GetDataSourceNames();

                rvActivosTerritorios.LocalReport.DataSources.Clear();

                List<sp_ReporteActivosPorTerritorios_Result> datosReporte = this.retornaDatosReporte(this.txtComite.Text, this.txtProvincia.Text, this.txtTipo.Text);

                ReportDataSource fuenteDatos = new ReportDataSource();
                fuenteDatos.Name = infoFuenteDatos[0];
                fuenteDatos.Value = datosReporte;

                this.rvActivosTerritorios.LocalReport.DataSources.Add(fuenteDatos);
                this.rvActivosTerritorios.LocalReport.Refresh();
            }
        }

        List<sp_ReporteActivosPorTerritorios_Result> retornaDatosReporte(string comite, string provincia, string tipoActivo)
        {
            return new CRUZROJACRINVEntities().sp_ReporteActivosPorTerritorios(comite, provincia, tipoActivo).ToList();
        }

        protected void btnGenerarReporte_Click(object sender, EventArgs e)
        {
            this.generarReporte();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            this.generarReporte();
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("https://login.microsoftonline.com/common/oauth2/v2.0/logout?post_logout_redirect_uri=http%3A%2F%2Flocalhost%3A50635%2FHome%2FIndex&x-client-SKU=ID_NET451&x-client-ver=5.2.1.0");
        }
    }
}