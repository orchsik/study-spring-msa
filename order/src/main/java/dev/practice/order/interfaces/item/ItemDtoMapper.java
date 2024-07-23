package dev.practice.order.interfaces.item;

import dev.practice.order.domain.item.ItemCommand;
import dev.practice.order.domain.item.ItemInfo;
import org.mapstruct.*;

/**
 * DTO (Data Transfer Object)와 명령 객체 (Command Object) 간의 매핑을 정의하는 ItemDtoMapper 인터페이스.
 * MapStruct는 Java 애플리케이션에서 객체 매핑을 쉽게 할 수 있게 도와주는 애노테이션 기반의 매핑 프레임워크.
 * Java 객체를 다른 Java 객체로 변환하는 코드를 자동으로 생성할 수 있다. 이는 특히 데이터 전송 객체(DTO)와 엔티티 간의 변환이 필요한 경우 유용하다.
 * 매핑 규칙이 필요하지 않은 경우는 기본적으로 소스 객체와 대상 객체의 필드 이름과 타입이 동일하거나, 자동으로 매핑할 수 있는 경우를 의미한다.
 */
@Mapper(
        componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        unmappedTargetPolicy = ReportingPolicy.ERROR
)
public interface ItemDtoMapper {

    // register
    @Mappings({@Mapping(target = "itemOptionGroupRequestList", source = "itemOptionGroupList")})
    ItemCommand.RegisterItemRequest of(ItemDto.RegisterItemRequest request);

    @Mappings({@Mapping(target = "itemOptionRequestList", source = "itemOptionList")})
    ItemCommand.RegisterItemOptionGroupRequest of(ItemDto.RegisterItemOptionGroupRequest request);

    ItemCommand.RegisterItemOptionRequest of(ItemDto.RegisterItemOptionRequest request);

    ItemDto.RegisterResponse of(String itemToken);

    // retrieve
    ItemDto.Main of(ItemInfo.Main main);

    ItemDto.ItemOptionGroupInfo of(ItemInfo.ItemOptionGroupInfo itemOptionGroup);

    ItemDto.ItemOptionInfo of(ItemInfo.ItemOptionInfo itemOption);
}
