package service;

import pojo.Address;

import java.util.List;

public interface AddressService {

    int addAddress(Address address);
    List<Address> getByuserId(Integer user_id);
    int update_add(Address address);
    Address getById(Integer id);
    int deleteById(Integer id);
}
