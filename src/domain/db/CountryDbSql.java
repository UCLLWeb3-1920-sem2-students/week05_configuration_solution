package domain.db;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import domain.model.Country;

public class CountryDbSql implements CountryDb {
	private Properties properties;
	private String url;
	
	public CountryDbSql(Properties properties) {
		this.properties = properties;
		try {
			Class.forName("org.postgresql.Driver");
			this.properties = properties;
			this.url = properties.getProperty("url");
		} catch (ClassNotFoundException e) {
			throw new DbException(e.getMessage(), e);
		}

	}
	
	public void add(Country country){
		if(country == null){
			throw new DbException("Nothing to add.");
		}
		String sql = "INSERT INTO web3.country (name, capital, inhabitants, votes) VALUES (?,?,?,?)";
		try (
				Connection connection = DriverManager.getConnection(url, properties);
				PreparedStatement statement = connection.prepareStatement(sql);
		) {
			statement.setString(1,country.getName());
			statement.setString(2, country.getCapital());
			statement.setInt(3,country.getNumberInhabitants());
			statement.setInt(4,country.getVotes());
			statement.execute();
		} 
		catch (SQLException e) {
			throw new DbException(e);
		}
	}
	
	public List<Country> getAll(){
		List<Country> countries = new ArrayList<Country>();
		String sql = "SELECT * FROM web3.country";
		try (
			Connection connection = DriverManager.getConnection(url, properties);
			PreparedStatement statement = connection.prepareStatement(sql);
		) {
			ResultSet result = statement.executeQuery();
			while(result.next()){
				String name = result.getString("name");
				String capital = result.getString("capital");
				int numberOfVotes = result.getInt("votes");
				int numberOfInhabitants = result.getInt("inhabitants");
				Country country= new Country(name, numberOfInhabitants,capital, numberOfVotes);
				countries.add(country);
			}
		} catch (SQLException e) {
			throw new DbException(e.getMessage(), e);
		}
		return countries;
	}
}
