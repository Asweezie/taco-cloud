package tacos.repository;

import java.util.Optional;

import tacos.domain.TacoOrder;;

public interface OrderRepository {

    TacoOrder save(TacoOrder order);

}
