package Repositories;

import Entities.Etudiant;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EtudiantRepository {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/iage_3a";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    public void insert(Etudiant etudiant) {
        String sql = "INSERT INTO etudiant (mat_etudiant, nom_complet, tutor_etudiant) VALUES (?, ?, ?)";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, etudiant.getMatri());
            statement.setString(2, etudiant.getNomComplet());
            statement.setString(3, etudiant.getTuteur());

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("L'étudiant a été inséré avec succès !");
            } else {
                System.out.println("Échec de l'insertion de l'étudiant.");
            }

            statement.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            System.out.println("Erreur de chargement de Driver");
        } catch (SQLException e) {
            System.out.println("Erreur de Connexion a la BD");
        }
    }

    public List<Etudiant> selectAll() {
        List<Etudiant> etudiants = new ArrayList<>();
        String sql = "SELECT * FROM etudiant";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery(sql);

            while (rs.next()) {
                Etudiant etudiant = new Etudiant();
                etudiant.setId(rs.getInt("id_etudiant"));
                etudiant.setMatri(rs.getString("mat_etudiant"));
                etudiant.setNomComplet(rs.getString("nom_complet"));
                etudiant.setTuteur(rs.getString("tutor_etudiant"));
                etudiants.add(etudiant);
            }

            rs.close();
            statement.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            System.out.println("Erreur de chargement de Driver");
        } catch (SQLException e) {
            System.out.println("Erreur de Connexion a la BD");
        }

        return etudiants;
    }

    public Etudiant selectEtudiantByMatri(String matri) {
        Etudiant etudiant = null;
        String sql = "SELECT * FROM etudiant WHERE mat_etudiant = ?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, matri);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                etudiant = new Etudiant();
                etudiant.setId(rs.getInt("id_etudiant"));
                etudiant.setMatri(rs.getString("mat_etudiant"));
                etudiant.setNomComplet(rs.getString("nom_complet"));
                etudiant.setTuteur(rs.getString("tutor_etudiant"));
            }

            rs.close();
            statement.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            System.out.println("Erreur de chargement de Driver");
        } catch (SQLException e) {
            System.out.println("Erreur de Connexion a la BD");
        }

        return etudiant;
    }

    public Etudiant selectEtudiantById(int etudiantId) {
        Etudiant etudiant = null;
        String sql = "SELECT * FROM etudiant WHERE id_etudiant = ?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, etudiantId);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                etudiant = new Etudiant();
                etudiant.setId(rs.getInt("id_etudiant"));
                etudiant.setMatri(rs.getString("mat_etudiant"));
                etudiant.setNomComplet(rs.getString("nom_complet"));
                etudiant.setTuteur(rs.getString("tutor_etudiant"));
            }

            rs.close();
            statement.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            System.out.println("Erreur de chargement de Driver");
        } catch (SQLException e) {
            System.out.println("Erreur de Connexion a la BD");
        }

        return etudiant;
    }
}
     

