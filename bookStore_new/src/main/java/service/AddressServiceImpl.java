package service;

import mapper.AddressMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Address;
import pojo.AddressExample;

import java.util.List;

@Service
public class AddressServiceImpl implements AddressService{

    @Autowired
    AddressMapper addressMapper;
    @Override
    public int addAddress(Address address) {
      return  addressMapper.insertSelective(address);

    }
    @Override
    public List<Address> getByuserId(Integer user_id){
        AddressExample addressExample=new AddressExample();
        addressExample.or().andUseridEqualTo(user_id);
        List<Address> listAdd=addressMapper.selectByExample(addressExample);
        return listAdd;
    }

    @Override
    public int update_add(Address address){

        return addressMapper.updateByPrimaryKeySelective(address);
    }

    @Override
    public Address getById(Integer id){

        Address address=addressMapper.selectByPrimaryKey(id);
        return address;
    }

    @Override
    public int deleteById(Integer id) {

        return  addressMapper.deleteByPrimaryKey(id);
    }
}
