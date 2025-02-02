package dev.practice.order.domain.partner;

public interface PartnerService {
    PartnerInfo registerPartner(PartnerCommand command);

    PartnerInfo getPartnerInfo(String partnerToken);

    PartnerInfo enablePrtner(String partnerToken);

    PartnerInfo disablePartner(String partnerToken);
}
