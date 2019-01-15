package com.micro.cloud.frame.kit;

import java.util.List;
import java.util.stream.Collectors;

import org.dozer.DozerBeanMapper;

public class BeanMapperKit {

    private static DozerBeanMapper mapper=SpringKit.getBean(DozerBeanMapper.class);
    
    public static <S,T> T convert(S source,Class<T> targetClass){
       return mapper.map(source, targetClass);
    }
    
    public static <S,T> List<T> convertList(List<S> sources,Class<T> targetClass){
        if(sources == null) {
            return null;
        }
        return sources
                .stream()
                .map(s -> mapper.map(s, targetClass))
                .collect(Collectors.toList());
     }
}
