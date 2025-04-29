package dao;
import java.sql.SQLException;
import java.util.List;

public interface DAO<T> {
    // T stands for 'Type'
    List<T> getAll() throws SQLException;
    int save(T t) throws SQLException;
    int update(T t) throws SQLException;
    int delete(T t) throws SQLException;
}
