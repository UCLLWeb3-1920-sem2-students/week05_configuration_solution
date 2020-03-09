package domain.db;

import java.util.List;

import domain.model.Country;

public interface CountryDb {

	void add(Country country);
	
	List<Country> getAll();
}
