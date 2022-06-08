
package DAO;

import Config.Conexion;
import Modelo.Categorias;
import Modelo.Dashboard;
import Modelo.Marcas;
import Modelo.Productos;
import Modelo.Venta;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class DAODashboard extends Conexion{
     public List<Dashboard> listar() throws Exception {
        List<Dashboard> dashboard;
        Dashboard dashb;

        ResultSet rs = null;
        String sql = "Select P.nombre as nombre, COUNT(P.idproducto)as CantVentas From detalle_ventas DV Inner join producto P on P.idproducto = DV.idproducto INNER JOIN Categoria C on C.idCategoria = P.idCategoria INNER JOIN marca M on M.idMarca = P.idMarca Group by DV.idProducto,C.categoria,M.marca,P.nombre Order by count(2) DESC LIMIT 5";


       try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            dashboard = new ArrayList<>();
            while (rs.next() == true) {
                dashb = new Dashboard();
                //dashb.setId_Producto(rs.getInt("idProducto"));
                dashb.setNombre(rs.getString("nombre"));
           // dashb.getCategoria().setNombreCategoria(rs.getString("categoria"));
                dashb.setCantProducts(rs.getInt("CantVentas"));
//                dashb.getCategoria().setNombreCategoria(rs.getString("Categoria"));
//                dashb.getMarca().setNombre(rs.getString("Marca"));
                dashboard.add(dashb);
       }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return dashboard;
     }
    
      public List<Categorias> contarCats() throws Exception {
        List<Categorias> categoria;
        Categorias cat;

        ResultSet rs = null;
        String sql = "Select C.categoria as nombre, COUNT(c.idCategoria) as cantCat From categoria C Order by count(C.idCategoria)";


       try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            categoria = new ArrayList<>();
            while (rs.next() == true) {
                cat = new Categorias();
                cat.setNombreCategoria(rs.getString("nombre"));
                cat.setContar(rs.getInt("cantCat"));
                categoria.add(cat);
       }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return categoria;
     }
      
      public List<Marcas> contarMarcas() throws Exception {
        List<Marcas> marcas;
        Marcas mar;

        ResultSet rs = null;
        String sql = "Select COUNT(idMarca) as cantMarca From marca  Order by count(idMarca)";


       try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            marcas = new ArrayList<>();
            while (rs.next() == true) {
                mar = new Marcas();
                mar.setContar(rs.getInt("cantMarca"));
                marcas.add(mar);
       }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return marcas;
     }
    public List<Productos> contarProductos() throws Exception {
        List<Productos> productos;
        Productos prod;

        ResultSet rs = null;
        String sql = "Select COUNT(idProducto) as cantProd From producto  Order by count(idProducto)";


       try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            productos = new ArrayList<>();
            while (rs.next() == true) {
                prod = new Productos();
                prod.setContar(rs.getInt("cantProd"));
                productos.add(prod);
       }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return productos;
     }
    
     public List<Venta> contarVentas() throws Exception {
        List<Venta> ventas;
        Venta vta;

        ResultSet rs = null;
        String sql = "Select COUNT(idventa) as cantVenta From venta  Order by count(idventa)";


       try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            ventas = new ArrayList<>();
            while (rs.next() == true) {
                vta = new Venta();
                vta.setContar(rs.getInt("cantVenta"));
                ventas.add(vta);
       }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
        }
        return ventas;
     }
      
      
}
