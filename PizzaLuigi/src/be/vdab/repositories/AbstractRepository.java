package be.vdab.repositories;

import javax.sql.DataSource;

public class AbstractRepository {

    public static final String JNDI_NAME = "jdbc/pizzaluigi";
    protected DataSource dataSource;

    public void setDataSource(DataSource dataSource) {
	this.dataSource = dataSource;
    }
}
