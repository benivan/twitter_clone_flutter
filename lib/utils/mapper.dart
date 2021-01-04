abstract class Mapper<E,M>{

  M mapEntityToModel(E entity);

  E mapModelTOEntity(M model);
}