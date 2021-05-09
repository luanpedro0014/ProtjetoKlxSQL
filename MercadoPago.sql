USE [Pagamento]
GO

/****** Object:  Table [dbo].['MercadoPago ]    Script Date: 08/05/2021 12:19:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].['MercadoPago ](
	[Data_compra (date_created)] [datetime] NULL,
	[Data_acreditacao (date_approved)] [datetime] NULL,
	[data_liberacao(date_released)] [datetime] NULL,
	[Nome_contraparte (counterpart_name)] [nvarchar](255) NULL,
	[Nickname_contraparte (counterpart_nickname)] [nvarchar](255) NULL,
	[E-mail_contraparte (counterpart_email)] [nvarchar](255) NULL,
	[Telefone_contraparte (counterpart_phone_number)] [nvarchar](255) NULL,
	[Documento_contraparte (buyer_document)] [nvarchar](255) NULL,
	[Identificador_produto (item_id)] [nvarchar](255) NULL,
	[Descricacao_operacao (reason)] [nvarchar](255) NULL,
	[Codigo_referencia (external_reference)] [nvarchar](255) NULL,
	[SKU_Producto (seller_custom_field)] [nvarchar](255) NULL,
	[Numero_operacao Mercado Pago (operation_id)] [float] NULL,
	[Estado_operacao (status)] [nvarchar](255) NULL,
	[Detalhe_estado_operacao (status_detail)] [nvarchar](255) NULL,
	[Tipo_operacao (operation_type)] [nvarchar](255) NULL,
	[Valor_produto(transaction_amount)] [nvarchar](255) NULL,
	[Tarifa_Mercado_Pago (mercadopago_fee)] [nvarchar](255) NULL,
	[Comissao_uso_plataforma_terceiros (marketplace_fee)] [nvarchar](255) NULL,
	[Custo_envio (shipping_cost)] [nvarchar](255) NULL,
	[Desconto_contraparte (coupon_fee)] [nvarchar](255) NULL,
	[Valor_recibido (net_received_amount)] [nvarchar](255) NULL,
	[Cuotas (installments)] [float] NULL,
	[Medio_pago (payment_type)] [nvarchar](255) NULL,
	[Valor_devolvido (amount_refunded)] [nvarchar](255) NULL,
	[Operador_dinheiro_devolvido (refund_operator)] [nvarchar](255) NULL,
	[Numero_reclamacao (claim_id)] [nvarchar](255) NULL,
	[Numero_estorno (chargeback_id)] [nvarchar](255) NULL,
	[Plataforma (marketplace)] [nvarchar](255) NULL,
	[Numero_venda_Mercado_Livre (order_id)] [nvarchar](255) NULL,
	[Numero_venda_negocio_online (merchant_order_id)] [float] NULL,
	[Numero_campanha_desconto (campaign_id)] [nvarchar](255) NULL,
	[Nome_companha(campaign_name)] [nvarchar](255) NULL,
	[Detalhe_venda  (activity_url)] [nvarchar](255) NULL,
	[Mercado_Pago_Point (id)] [nvarchar](255) NULL,
	[Status_envio (shipment_status)] [nvarchar](255) NULL,
	[Domicilio_comprador (buyer_address)] [nvarchar](255) NULL,
	[Codigo_seguimiento (tracking_number)] [nvarchar](255) NULL,
	[Operador_cobrança_Point (operator_name)] [nvarchar](255) NULL,
	[Numero_local (store_id)] [nvarchar](255) NULL,
	[Numero_caixa (pos_id)] [nvarchar](255) NULL,
	[Numero_caixa_externa (external_id)] [datetime] NULL,
	[Custos_financeiro (financing_fee)] [nvarchar](255) NULL
) ON [PRIMARY]
GO


