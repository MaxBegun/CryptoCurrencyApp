import Foundation

struct CurrencyModelConverter {
    static let instance = CurrencyModelConverter()
    
    func convert(_ serverModel: CurrencyServerModel) -> CurrencyClientModel {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dataEnd = dateFormatter.date(from: serverModel.data_end ?? "")
        let dataOrderbookEnd = dateFormatter.date(from: serverModel.data_orderbook_end ?? "")
        let dataOrderbookStart = dateFormatter.date(from: serverModel.data_orderbook_start ?? "")
        let dataQuoteEnd = dateFormatter.date(from: serverModel.data_quote_end ?? "")
        let dataQuoteStart = dateFormatter.date(from: serverModel.data_quote_start ?? "")
        let dataStart = dateFormatter.date(from: serverModel.data_start ?? "")
        let dataTradeEnd = dateFormatter.date(from: serverModel.data_trade_end ?? "")
        let dataTradeStart = dateFormatter.date(from: serverModel.data_trade_start ?? "")
        let typeIsCrypto = serverModel.type_is_crypto == 1 ? true:false

        let clientModel = CurrencyClientModel(assetId: serverModel.asset_id,
                                              dataEnd: dataEnd,
                                              dataOrderbookEnd: dataOrderbookEnd,
                                              dataOrderbookStart: dataOrderbookStart,
                                              dataQuoteEnd: dataQuoteEnd,
                                              dataQuoteStart: dataQuoteStart,
                                              dataStart: dataStart,
                                              dataSymbolsCount: serverModel.data_symbols_count,
                                              dataTradeEnd: dataTradeEnd,
                                              dataTradeStart: dataTradeStart,
                                              idIcon: serverModel.id_icon,
                                              name: serverModel.name,
                                              priceUsd: serverModel.price_usd,
                                              typeIsCrypto: typeIsCrypto)
        return clientModel
    }
    private init() {}
    }
