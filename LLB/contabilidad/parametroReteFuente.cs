﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;

using Brainsbits.LDA;
using Brainsbits.LLB.seguridad;

namespace Brainsbits.LLB.contabilidad
{
    public class parametroReteFuente
    {
        #region varialbes
        String _empresa = null;
        String _mensaje_error = null;
        String _usuario = null;
        #endregion varialbes

        #region propiedades
        public String Empresa
        {
            get { return _empresa; }
            set { _empresa = value; }
        }

        public String MensajeError
        {
            get { return _mensaje_error; }
            set { _mensaje_error = value; }
        }

        public String Usuario
        {
            get { return _usuario; }
            set { _usuario = value; }
        }
        #endregion propiedades

        #region constructores
        public parametroReteFuente(String idEmpresa, String usuario)
        {
            Empresa = idEmpresa;
            Usuario = usuario;
        }
        #endregion constructores

        #region metodos

        public DataTable ObtenerTodos()
        {
            Conexion conexion = new Conexion(Empresa);
            DataSet _dataSet = new DataSet();
            DataView _dataView = new DataView();
            DataTable _dataTable = new DataTable();
            String sql = null;
            Boolean ejecutar = true;

            sql = "usp_param_retencion_obtener_todos ";

            #region validaciones

            #endregion

            if (ejecutar == true)
            {
                try
                {
                    _dataSet = conexion.ExecuteReader(sql);
                    _dataView = _dataSet.Tables[0].DefaultView;
                    _dataTable = _dataView.Table;
                }
                catch (Exception e)
                {
                    MensajeError = e.Message;
                }
                finally
                {
                    conexion.Desconectar();
                }
            }
            return _dataTable;
        }

        public DataTable ObtenerPorId(Int32 ID_RETEFUENTE)
        {
            Conexion conexion = new Conexion(Empresa);
            DataSet _dataSet = new DataSet();
            DataView _dataView = new DataView();
            DataTable _dataTable = new DataTable();
            String sql = null;
            Boolean ejecutar = true;

            sql = "usp_param_retencion_obtener_registro ";

            #region validaciones
            if (ID_RETEFUENTE != 0)
            {
                sql += ID_RETEFUENTE.ToString() + " ";
            }
            else
            {
                MensajeError = "El campo ID_RETEFUENTE es requerido para la consulta.";
                ejecutar = false;
            }
            #endregion

            if (ejecutar == true)
            {
                try
                {
                    _dataSet = conexion.ExecuteReader(sql);
                    _dataView = _dataSet.Tables[0].DefaultView;
                    _dataTable = _dataView.Table;
                }
                catch (Exception e)
                {
                    MensajeError = e.Message;
                }
                finally
                {
                    conexion.Desconectar();
                }
            }
            return _dataTable;
        }

        public Decimal Adicionar(String DESCRIPCION, Decimal BASE_RETENCION, Decimal PORCENTAJE, String COD_CONTABLE, Boolean TABLA_UVT)
        {
            String sql = null;
            String idRecuperado = null;
            String informacion = null;
            Boolean ejecutar = true;

            sql = "usp_param_retencion_adicionar ";

            if (!(String.IsNullOrEmpty(DESCRIPCION)))
            {
                sql += "'" + DESCRIPCION + "', ";
                informacion += "DESCRIPCION = '" + DESCRIPCION.ToString() + "', ";
            }
            else
            {
                MensajeError += "El campo DESCRIPCION no puede ser nulo\n";
                ejecutar = false;
            }

            sql += "'" + BASE_RETENCION.ToString() + "', ";
            informacion += "BASE_RETENCION= '" + BASE_RETENCION.ToString() + ", ";

            sql += "'" + PORCENTAJE.ToString() + "', ";
            informacion += "PORCENTAJE= '" + PORCENTAJE.ToString() + "', ";

            if (!(String.IsNullOrEmpty(COD_CONTABLE)))
            {
                sql += "'" + COD_CONTABLE + "', ";
                informacion += "COD_CONTABLE = '" + COD_CONTABLE.ToString() + "', ";
            }
            else
            {
                MensajeError += "El campo CODIGO CONTABLE no puede ser nulo\n";
                ejecutar = false;
            }

            sql += "'" + TABLA_UVT + "', ";
            informacion += "TABLA_UVT = '" + TABLA_UVT.ToString() + "', ";

            sql += "'" + Usuario + "' ";
            informacion += "USU_CRE = '" + Usuario.ToString() + "'";

            if (ejecutar)
            {
                Conexion conexion = new Conexion(Empresa);
                try
                {
                    idRecuperado = conexion.ExecuteScalar(sql);

                    #region auditoria
                    auditoria _auditoria = new auditoria(Empresa);
                    _auditoria.Adicionar(Usuario, tabla.PAR_RETENCION, tabla.ACCION_ADICIONAR, sql, informacion, conexion);
                    #endregion auditoria
                }
                catch (Exception e)
                {
                    MensajeError = e.Message;
                }
                finally
                {
                    conexion.Desconectar();
                }
            }

            if (!(String.IsNullOrEmpty(idRecuperado))) return Convert.ToDecimal(idRecuperado);
            else return 0;
        }

        public Boolean Actualizar(Int32 ID_RETEFUENTE, String DESCRIPCION, Decimal BASE_RETENCION, Decimal PORCENTAJE, String COD_CONTABLE, Boolean TABLA_UVT)
        {
            Int32 cantidadRegistrosActualizados = 0;
            String sql = null;
            String informacion = null;
            Boolean ejecutar = true;

            sql = "usp_param_retencion_actualizar ";

            #region validaciones
            if (ID_RETEFUENTE != 0)
            {
                sql += ID_RETEFUENTE.ToString() + ", ";
                informacion += "ID_RETEFUENTE= '" + ID_RETEFUENTE.ToString() + "', ";
            }
            else
            {
                MensajeError += "El campo ID_RETEFUENTE no puede ser nulo\n";
                ejecutar = false;
            }

            if (!(String.IsNullOrEmpty(DESCRIPCION)))
            {
                sql += "'" + DESCRIPCION + "', ";
                informacion += "DESCRIPCION = '" + DESCRIPCION.ToString() + "', ";
            }
            else
            {
                MensajeError += "El campo DESCRIPCION no puede ser nulo\n";
                ejecutar = false;
            }

            sql += "'" + BASE_RETENCION.ToString() + "', ";
            informacion += "BASE_RETENCION= '" + BASE_RETENCION.ToString() + "', ";

            sql += "'" + PORCENTAJE.ToString() + "', ";
            informacion += "PORCENTAJE= '" + PORCENTAJE.ToString() + "', ";

            if (!(String.IsNullOrEmpty(COD_CONTABLE)))
            {
                sql += "'" + COD_CONTABLE + "', ";
                informacion += "COD_CONTABLE = '" + COD_CONTABLE.ToString() + "', ";
            }
            else
            {
                MensajeError += "El campo COD_CONTABLE no puede ser nulo\n";
                ejecutar = false;
            }

            sql += "'" + TABLA_UVT + "', ";
            informacion += "TABLA_UVT = '" + TABLA_UVT + "', ";

            sql += "'" + Usuario + "' ";
            informacion += "USU_MOD = '" + Usuario.ToString() + "' ";

            #endregion validaciones

            if (ejecutar)
            {
                Conexion conexion = new Conexion(Empresa);
                try
                {
                    cantidadRegistrosActualizados = conexion.ExecuteNonQuery(sql);
                    #region auditoria
                    auditoria _auditoria = new auditoria(Empresa);
                    _auditoria.Adicionar(Usuario, tabla.VEN_SUB_CENTROS, tabla.ACCION_ACTUALIZAR, sql, informacion, conexion);
                    #endregion auditoria
                }
                catch (Exception e)
                {
                    MensajeError = e.Message;
                }
                finally
                {
                    conexion.Desconectar();
                }
            }

            if (cantidadRegistrosActualizados > 0) return true;
            else return false;
        }

        #endregion metodos
    }
}