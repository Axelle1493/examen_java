package Repositories;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Entities.Classe;

public class ClasseRepository {
    // Paramètres de connexion à la base de données
    private static final String DB_URL = "jdbc:mysql://localhost:3306/iage_3a";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    // Méthode pour récupérer toutes les classes
    public List<Classe> selectAll() {
        List<Classe> classes = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
             PreparedStatement statement = conn.prepareStatement("SELECT * FROM classes");
             ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                Classe cl = new Classe(rs.getInt("id_classe"), rs.getString("Libelle_classe"));
                classes.add(cl);
            }
        } catch (SQLException e) {
            System.out.println("Erreur lors de la récupération des classes : " + e.getMessage());
            e.printStackTrace();
        }
        return classes;
    }

    // Méthode pour insérer une nouvelle classe
    public void insert(Classe classe) {
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
             PreparedStatement statement = conn.prepareStatement("INSERT INTO classes (Libelle_classe) VALUES (?)")) {
            statement.setString(1, classe.getLibelle());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Erreur lors de l'insertion d'une nouvelle classe : " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Méthode pour rechercher une classe par ID
    public Classe selectClasseById(int id) {
        Classe classe = null;
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
             PreparedStatement statement = conn.prepareStatement("SELECT * FROM classes WHERE id_classe = ?")) {
            statement.setInt(1, id);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    classe = new Classe(rs.getInt("id_classe"), rs.getString("Libelle_classe"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Erreur lors de la recherche d'une classe par ID : " + e.getMessage());
            e.printStackTrace();
        }
        return classe;
    }

    // Méthode pour rechercher une classe par libellé
    public Classe selectClasseByLibelle(String libelle) {
        Classe classe = null;
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
             PreparedStatement statement = conn.prepareStatement("SELECT * FROM classes WHERE Libelle_classe LIKE ?")) {
            statement.setString(1, "%" + libelle + "%");
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    classe = new Classe(rs.getInt("id_classe"), rs.getString("Libelle_classe"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Erreur lors de la recherche d'une classe par libellé : " + e.getMessage());
            e.printStackTrace();
        }
        return classe;
    }
}