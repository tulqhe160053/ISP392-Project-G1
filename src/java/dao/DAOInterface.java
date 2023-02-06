/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.ArrayList;

/**
 *
 * @author Tu
 */
public interface DAOInterface<T> {

    public ArrayList<T> selectAll();

    public T selectById(T t);

    /**
     *
     * @param t
     */
    public void insert(T t);

    public int insertAll(ArrayList<T> arr);

    /**
     *
     * @param t
     */
    public void delete(T t);

    public int deleteAll(ArrayList<T> arr);

    public void update(int x,T t);
}
