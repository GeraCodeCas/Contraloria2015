if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ANEXOSXM_REFERENCE_ANEXO]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[AnexoEstatus] DROP CONSTRAINT FK_ANEXOSXM_REFERENCE_ANEXO
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_USUARIOA_REFERENCE_ANEXO]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[UsuarioAnexo] DROP CONSTRAINT FK_USUARIOA_REFERENCE_ANEXO
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ANEXO3IVa]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Anexo3IV6] DROP CONSTRAINT FK_ANEXO3IVa
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ANEXO3IVb]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Anexo3IV6] DROP CONSTRAINT FK_ANEXO3IVb
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_FUNCIONARIO2]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Funcionario] DROP CONSTRAINT FK_FUNCIONARIO2
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ANEXO3IV]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Anexo3IV6Curso] DROP CONSTRAINT FK_ANEXO3IV
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ANEXOIV6_REFERENCE_FUNCIONA]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Anexo3IV6Empleado] DROP CONSTRAINT FK_ANEXOIV6_REFERENCE_FUNCIONA
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ANEXO3VI_REFERENCE_FUNCIONA]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Anexo3VII] DROP CONSTRAINT FK_ANEXO3VI_REFERENCE_FUNCIONA
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ANEXOARC_REFERENCE_FUNCIONA]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[AnexoArchivo] DROP CONSTRAINT FK_ANEXOARC_REFERENCE_FUNCIONA
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ANEXOS1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[AnexoEstatus] DROP CONSTRAINT FK_ANEXOS1
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_DATOSGEN1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[DatosGeneralesActa] DROP CONSTRAINT FK_DATOSGEN1
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_USUARIOA_REFERENCE_FUNCIONA]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[UsuarioAnexo] DROP CONSTRAINT FK_USUARIOA_REFERENCE_FUNCIONA
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_USUARIOLIM1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[UsuarioLimitado] DROP CONSTRAINT FK_USUARIOLIM1
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_UNIDADAD2]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[UnidadAdministrativa] DROP CONSTRAINT FK_UNIDADAD2
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Anexo3IV1_TipoNomina]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Anexo3IV1] DROP CONSTRAINT FK_Anexo3IV1_TipoNomina
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Anexo3IV2_TipoNomina]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Anexo3IV2] DROP CONSTRAINT FK_Anexo3IV2_TipoNomina
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Anexo3IV5_TipoNomina]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Anexo3IV5] DROP CONSTRAINT FK_Anexo3IV5_TipoNomina
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_CARGO2]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Cargo] DROP CONSTRAINT FK_CARGO2
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_UnidadAdministrativa_UnidadGobierno]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[UnidadAdministrativa] DROP CONSTRAINT FK_UnidadAdministrativa_UnidadGobierno
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Funcionario_Usuario]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Funcionario] DROP CONSTRAINT FK_Funcionario_Usuario
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_USUARIOLIM2]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[UsuarioLimitado] DROP CONSTRAINT FK_USUARIOLIM2
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_USUARIORH1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[UsuarioRH] DROP CONSTRAINT FK_USUARIORH1
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_USUARIOA_REFERENCE_USUARIOL]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[UsuarioAnexo] DROP CONSTRAINT FK_USUARIOA_REFERENCE_USUARIOL
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CONSULTA_USUARIO]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CONSULTA_USUARIO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo1II]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo1II]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo2III]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo2III]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo2IV]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo2IV]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo2IV1]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo2IV1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo2IV2]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo2IV2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo2IV3]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo2IV3]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo2V]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo2V]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo2VI]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo2VI]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3IV1]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3IV1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3IV1RH]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3IV1RH]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3IV2]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3IV2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3IV2RH]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3IV2RH]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3IV5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3IV5]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3IV5RH]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3IV5RH]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3IX]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3IX]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3V1]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3V1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3V2]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3V2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3V3]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3V3]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3V4]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3V4]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3V5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3V5]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3V6]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3V6]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3V7]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3V7]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3VI]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3VI]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3X]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3X]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3XI]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3XI]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3XII]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3XII]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3XV]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3XV]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3XVI]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3XVI]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CargaAnexo3XVII]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CargaAnexo3XVII]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo1iiCountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo1iiCountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo1iiGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo1iiGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo1iiGetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo1iiGetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2iiiCountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2iiiCountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2iiiGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2iiiGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2iiiGetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2iiiGetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2iv1CountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2iv1CountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2iv1GetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2iv1GetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2iv1GetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2iv1GetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2iv2CountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2iv2CountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2iv2GetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2iv2GetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2iv2GetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2iv2GetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2iv3CountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2iv3CountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2iv3GetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2iv3GetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2iv3GetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2iv3GetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2ivCountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2ivCountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2ivGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2ivGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2ivGetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2ivGetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2vCountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2vCountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2vGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2vGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2vGetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2vGetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2viCountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2viCountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2viGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2viGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo2viGetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo2viGetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3iv1CountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3iv1CountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3iv1GetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3iv1GetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3iv1GetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3iv1GetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3iv1RHCountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3iv1RHCountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3iv1RHGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3iv1RHGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3iv2CountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3iv2CountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3iv2GetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3iv2GetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3iv2GetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3iv2GetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3iv2RHCountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3iv2RHCountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3iv2RHGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3iv2RHGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3iv5CountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3iv5CountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3iv5GetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3iv5GetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3iv5GetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3iv5GetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3iv5RHCountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3iv5RHCountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3iv5RHGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3iv5RHGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3iv6GetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3iv6GetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3ixCountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3ixCountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3ixGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3ixGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3ixGetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3ixGetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v1CountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v1CountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v1GetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v1GetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v1GetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v1GetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v2CountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v2CountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v2GetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v2GetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v2GetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v2GetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v3CountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v3CountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v3GetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v3GetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v3GetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v3GetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v4CountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v4CountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v4GetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v4GetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v4GetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v4GetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v5CountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v5CountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v5GetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v5GetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v5GetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v5GetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v6CountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v6CountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v6GetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v6GetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v6GetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v6GetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v7CountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v7CountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v7GetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v7GetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3v7GetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3v7GetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3viCountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3viCountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3viGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3viGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3xCountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3xCountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3xGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3xGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3xGetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3xGetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3xiCountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3xiCountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3xiGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3xiGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3xiGetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3xiGetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3xiiCountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3xiiCountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3xiiGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3xiiGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3xiiGetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3xiiGetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3xvCountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3xvCountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3xvGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3xvGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3xvGetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3xvGetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3xviCountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3xviCountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3xviGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3xviGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3xviGetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3xviGetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3xviiCountAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3xviiCountAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3xviiGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3xviiGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sel_Anexo3xviiGetAll_SP]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sel_Anexo3xviiGetAll_SP]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Adendum]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Adendum]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo1I]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo1I]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo1II]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo1II]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo2I]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo2I]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo2II]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo2II]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo2III]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo2III]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo2IV]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo2IV]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo2IV1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo2IV1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo2IV2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo2IV2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo2IV3]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo2IV3]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo2IV3Observaciones]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo2IV3Observaciones]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo2V]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo2V]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo2VI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo2VI]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo2VII]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo2VII]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3I]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3I]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3II]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3II]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3III]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3III]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3IV]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3IV]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3IV1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3IV1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3IV2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3IV2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3IV3]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3IV3]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3IV4]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3IV4]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3IV5]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3IV5]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3IV6]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3IV6]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3IV6Curso]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3IV6Curso]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3IV6Empleado]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3IV6Empleado]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3IX]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3IX]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3V1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3V1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3V2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3V2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3V2I]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3V2I]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3V2II]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3V2II]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3V3]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3V3]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3V4]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3V4]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3V5]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3V5]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3V6]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3V6]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3V7]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3V7]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3VI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3VI]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3VII]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3VII]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3X]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3X]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3XI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3XI]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3XII]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3XII]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3XIII]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3XIII]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3XIV]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3XIV]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3XV]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3XV]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3XV1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3XV1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3XVI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3XVI]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3XVII]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3XVII]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3XVIII]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3XVIII]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3XVIIIBak]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3XVIIIBak]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Anexo3XVIIITmp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Anexo3XVIIITmp]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AnexoArchivo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AnexoArchivo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AnexoEstatus]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AnexoEstatus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Bitacora]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Bitacora]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Cargo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Cargo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DatosGeneralesActa]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DatosGeneralesActa]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DetalleAnexo1I]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DetalleAnexo1I]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DetalleAnexo2IV1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DetalleAnexo2IV1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DetalleAnexo2IV3]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DetalleAnexo2IV3]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Enlace]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Enlace]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EntregaEstatus]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EntregaEstatus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo1II]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo1II]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo2III]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo2III]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo2IV]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo2IV]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo2IV1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo2IV1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo2IV2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo2IV2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo2IV3]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo2IV3]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo2V]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo2V]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo2VI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo2VI]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3IV1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3IV1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3IV1RH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3IV1RH]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3IV2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3IV2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3IV2RH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3IV2RH]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3IV5]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3IV5]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3IV5RH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3IV5RH]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3IX]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3IX]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3V1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3V1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3V2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3V2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3V3]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3V3]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3V4]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3V4]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3V5]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3V5]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3V6]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3V6]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3V7]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3V7]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3VI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3VI]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3X]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3X]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3XI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3XI]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3XII]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3XII]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3XV]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3XV]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3XVI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3XVI]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ErrAnexo3XVII]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ErrAnexo3XVII]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Funcionario]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Funcionario]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Historico]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Historico]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[HistoricoAvance]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[HistoricoAvance]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Mensaje]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Mensaje]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MensajeRH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MensajeRH]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Municipio]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Municipio]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo1II]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo1II]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo2III]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo2III]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo2IV]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo2IV]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo2IV1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo2IV1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo2IV2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo2IV2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo2IV3]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo2IV3]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo2V]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo2V]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo2VI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo2VI]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3IV1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3IV1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3IV1RH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3IV1RH]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3IV2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3IV2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3IV2RH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3IV2RH]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3IV5]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3IV5]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3IV5RH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3IV5RH]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3IX]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3IX]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3V1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3V1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3V2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3V2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3V3]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3V3]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3V4]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3V4]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3V5]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3V5]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3V6]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3V6]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3V7]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3V7]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3VI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3VI]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3X]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3X]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3XI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3XI]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3XII]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3XII]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3XV]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3XV]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3XVI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3XVI]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PasoAnexo3XVII]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PasoAnexo3XVII]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ResumenAnexo3iv1RH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ResumenAnexo3iv1RH]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ResumenAnexo3iv2RH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ResumenAnexo3iv2RH]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ResumenAnexo3iv5RH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ResumenAnexo3iv5RH]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sesion]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Sesion]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TipoDocumento]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TipoDocumento]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TipoNomina]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TipoNomina]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UnidadAdministrativa]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[UnidadAdministrativa]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UnidadGobierno]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[UnidadGobierno]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Usuario]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Usuario]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UsuarioAnexo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[UsuarioAnexo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UsuarioLimitado]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[UsuarioLimitado]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UsuarioRH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[UsuarioRH]
GO

CREATE TABLE [dbo].[Adendum] (
	[IdRenglon] [numeric](5, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionarioAnt] [numeric](5, 0) NULL ,
	[IdFuncionarioNvo] [numeric](5, 0) NULL ,
	[IdAnexo] [numeric](2, 0) NULL ,
	[Observacion] [ntext] COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo] (
	[IdAnexo] [numeric](2, 0) NOT NULL ,
	[Clave] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Nombre] [nvarchar] (250) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[NombreCorto] [nvarchar] (15) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo1I] (
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NULL ,
	[Ley] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Nombre] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[ObjetivoGeneral] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fideicomitente] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fiduciario] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fideicomisario] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaCreacion] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaPublicacion] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[PeriodicoOficial] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo1II] (
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NULL ,
	[IdTipo] [numeric](3, 0) NULL ,
	[Numero] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaSuscripcion] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Duracion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Descripcion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[ImporteTotal] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Entidad] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observaciones] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo2I] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[PresupuestoAprobado] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Incrementos] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Reducciones] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[ProgramasEspeciales] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[TotalAprobado] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[TotalEjercido] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[TotalPorEjercer] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observaciones] [ntext] COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo2II] (
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NULL ,
	[Departamento] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[MontoTotal] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Efectivo] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Comprobantes] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[ValesProvisionales] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Otros] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[ResponsableFondo] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo2III] (
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NULL ,
	[NumeroOficio] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fecha] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Concepto] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observaciones] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo2IV] (
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NULL ,
	[NombreInstitucion] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[NoCuenta] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[TipoInversion] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Saldo] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaVencimiento] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo2IV1] (
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NULL ,
	[NoCuenta] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Nombre] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Chequera] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Banco] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Inicial] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Final] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Numero] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fecha] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo2IV2] (
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NULL ,
	[Fecha] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[NoCuenta] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Banco] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Beneficiario] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[NoCheque] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo2IV3] (
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NULL ,
	[Fecha] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[NoCuenta] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[NombreInstitucion] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[TipoInversion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Vencimiento] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Saldo] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo2IV3Observaciones] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Observaciones] [ntext] COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo2V] (
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NULL ,
	[NumeroDocumento] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[NombreDeudor] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Concepto] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaVencimiento] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Saldo] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo2VI] (
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NULL ,
	[NumeroDocumento] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[NombreAcreedor] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Concepto] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaVencimiento] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Saldo] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo2VII] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[BalanceGeneral] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[EstadoResultados] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[EstadoOrigen] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[LibrosRegistros] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[EstadosFinancieros] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[QuienAudito] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaCierre] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaAuditoria] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3I] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[EstructuraOrganizacional] [ntext] COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3II] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[MarcoJuridico] [ntext] COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3III] (
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Titulo] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[AreaAplicacion] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3IV] (
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Categoria] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[TotalPersonas] [nvarchar] (5) COLLATE Modern_Spanish_CI_AS NULL ,
	[TotalSueldos] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Confianza] [nvarchar] (5) COLLATE Modern_Spanish_CI_AS NULL ,
	[Base] [nvarchar] (5) COLLATE Modern_Spanish_CI_AS NULL ,
	[Otros] [nvarchar] (5) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3IV1] (
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Nombre] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Puesto] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Categoria] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Adscripcion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[TipoPlaza] [numeric](1, 0) NULL ,
	[SueldoBase] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Compensacion] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[OtrasPrestaciones] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Total] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observaciones] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[ClaveTipoNomina] [nvarchar] (2) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3IV2] (
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Nomina] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Nombre] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Situacion] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[DeComisionado] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[AComisionado] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaDePeriodo] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaAPeriodo] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observaciones] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[ClaveTipoNomina] [nvarchar] (2) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3IV3] (
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[NoEmpleado] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Nombre] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[NoCheque] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observaciones] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3IV4] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[Fecha] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Nombre] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observaciones] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3IV5] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[Numero] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Nombre] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Puesto] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[UnidadAdministrativa] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[ClaveTipoNomina] [nvarchar] (2) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3IV6] (
	[IdCurso] [numeric](6, 0) NOT NULL ,
	[IdEmpleado] [numeric](6, 0) NOT NULL ,
	[Horas] [numeric](5, 0) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3IV6Curso] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[IdCurso] [numeric](6, 0) NOT NULL ,
	[Nombre] [nvarchar] (60) COLLATE Modern_Spanish_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3IV6Empleado] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[IdEmpleado] [numeric](6, 0) NOT NULL ,
	[Nombre] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3IX] (
	[IdAnexo3IX] [numeric](18, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NULL ,
	[NoExpediente] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[NoProgresivo] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Nombre] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Destino] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[EstadoInmueble] [int] NULL ,
	[TipoInmueble] [int] NULL ,
	[TipoAccion] [int] NULL ,
	[Observaciones] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3V1] (
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[NoInventario] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Descripcion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Marca] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Modelo] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Serie] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Valor] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Ubicacion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Resguardante] [nvarchar] (150) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [char] (1) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3V2] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[Clave] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[NumFactura] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fecha] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Concepto] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [char] (1) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3V2I] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[Sistema] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Programa] [nvarchar] (5) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tablas] [nvarchar] (3) COLLATE Modern_Spanish_CI_AS NULL ,
	[ManualTecnico] [bit] NULL ,
	[ManualOperacion] [bit] NULL ,
	[Ubicacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3V2II] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[Software] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Marca] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Version] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Licencia] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Discos] [nvarchar] (3) COLLATE Modern_Spanish_CI_AS NULL ,
	[Manuales] [nvarchar] (3) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3V3] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[Clave] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[NumFactura] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fecha] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Concepto] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3V4] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[NoInventario] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[NoEconomico] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Marca] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Modelo] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Color] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Placas] [nvarchar] (15) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[Serie] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Resguardante] [nvarchar] (150) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observaciones] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3V5] (
	[IdFuncionario] [numeric](6, 0) NULL ,
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[Clave] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Calibre] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Matricula] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Nombre] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Cargo] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3V6] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[Clave] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[NumFactura] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fecha] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Concepto] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [char] (1) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3V7] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[Titulo] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fecha] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Autores] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Nombre] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Departamento] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3VI] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[NoNombre] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Unidad] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[PrecioUnitario] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Existencia] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3VII] (
	[IdAnexo3VII] [numeric](5, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[NoForma] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Cantidad] [numeric](18, 0) NULL ,
	[Nombre] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[PrecioUnitario] [numeric](20, 2) NULL ,
	[AreaResponsable] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3X] (
	[IdAnexo3X] [numeric](8, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Clave] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Programa] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [tinyint] NULL ,
	[MontoAprobado] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[MontoEjercido] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaInicial] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaFinal] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[AvanceFisico] [nvarchar] (5) COLLATE Modern_Spanish_CI_AS NULL ,
	[AvanceFinanciero] [nvarchar] (5) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[TipoOrigen] [numeric](1, 0) NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3XI] (
	[IdAnexo3XI] [numeric](8, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Clave] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Programa] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[NoAprobacion] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[InversionAprobada] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[InversionEjercida] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[ObrasEntregadas] [numeric](16, 0) NULL ,
	[ObrasPorEntregar] [numeric](18, 0) NULL ,
	[UnidadMedida] [nvarchar] (30) COLLATE Modern_Spanish_CI_AS NULL ,
	[CantidadTotal] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[TipoOrigen] [numeric](1, 0) NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3XII] (
	[IdAnexo3XII] [numeric](18, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Clave] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Obra] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[NoContrato] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[NombreContratista] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[CostoTotal] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[AnticipoOtorgado] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[AnticipoAmortizado] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[TipoOrigen] [numeric](1, 0) NULL ,
	[SaldoAnticipoAmortizar] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3XIII] (
	[IdAnexo3XIII] [numeric](18, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[NoCompromiso] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fecha] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Descripcion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Situacion] [numeric](1, 0) NULL ,
	[AvanceFisico] [nvarchar] (3) COLLATE Modern_Spanish_CI_AS NULL ,
	[AvanceFinanciero] [nvarchar] (3) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3XIV] (
	[IdAnexo3XIV] [numeric](18, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[NoCompromiso] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fecha] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Descripcion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Situacion] [numeric](18, 0) NULL ,
	[AvanceFisico] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[AvanceFinanciero] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3XV] (
	[IdAnexo3XV] [numeric](18, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NULL ,
	[Identificacion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Expediente] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Periodo] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Ubicacion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Documento] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3XV1] (
	[IdAnexo3XV1] [numeric](18, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Identificacion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Diskette] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[CD] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Periodo] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Ubicacion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Programa] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3XVI] (
	[IdAnexo3XVI] [numeric](18, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NULL ,
	[Identificacion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Expediente] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Periodo] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Ubicacion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Documento] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3XVII] (
	[IdAnexo3XVII] [numeric](18, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Expediente] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Asunto] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaInicio] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Situacion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaSolucion] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[UltimaCarga] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3XVIII] (
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Consecutivo] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Clave] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Justificacion] [nvarchar] (1000) COLLATE Modern_Spanish_CI_AS NULL ,
	[Descripcion] [nvarchar] (1000) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [nvarchar] (1000) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tecnico] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[Financiero] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[SocioEconomico] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[PlanoEjecutivo] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[PlanoDetalle] [char] (1) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3XVIIIBak] (
	[IdRenglon] [numeric](8, 0) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Consecutivo] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Clave] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Justificacion] [ntext] COLLATE Modern_Spanish_CI_AS NULL ,
	[Descripcion] [ntext] COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [ntext] COLLATE Modern_Spanish_CI_AS NULL ,
	[Tecnico] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[Financiero] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[SocioEconomico] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[PlanoEjecutivo] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[PlanoDetalle] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaSYS] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[Anexo3XVIIITmp] (
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Consecutivo] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Clave] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Justificacion] [ntext] COLLATE Modern_Spanish_CI_AS NULL ,
	[Descripcion] [ntext] COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [ntext] COLLATE Modern_Spanish_CI_AS NULL ,
	[Tecnico] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[Financiero] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[SocioEconomico] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[PlanoEjecutivo] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[PlanoDetalle] [char] (1) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[AnexoArchivo] (
	[IdAnexoArchivo] [numeric](5, 0) IDENTITY (1, 1) NOT NULL ,
	[IdAnexo] [numeric](2, 0) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[RutaAcceso] [varchar] (70) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[NombreArchivo] [varchar] (100) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[RutaWeb] [varchar] (70) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[AnexoEstatus] (
	[IdAnexo] [numeric](2, 0) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Estatus] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[IdUsuario] [numeric](6, 0) NULL ,
	[FechaActualizacion] [numeric](8, 0) NULL ,
	[Observacion] [varchar] (100) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Bitacora] (
	[Usuario] [varchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fecha] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Accion] [varchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[DireccionIP] [varchar] (15) COLLATE Modern_Spanish_CI_AS NULL ,
	[NombreMaquina] [varchar] (70) COLLATE Modern_Spanish_CI_AS NULL ,
	[InformacionMaquina] [varchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaSys] [nvarchar] (8) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Cargo] (
	[IdCargo] [numeric](4, 0) IDENTITY (1, 1) NOT NULL ,
	[Nombre] [nvarchar] (30) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[IdUnidadAdministrativa] [numeric](4, 0) NULL ,
	[IdFuncionario] [numeric](6, 0) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DatosGeneralesActa] (
	[IdFuncionario] [numeric](6, 0) NULL ,
	[FechaCierre] [numeric](8, 0) NULL ,
	[UnidadGobierno] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Ciudad] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Hora] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaActa] [numeric](8, 0) NULL ,
	[Direccion] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[NombreEntrega] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[NombreRecibe] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Cargo] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaEntrante] [numeric](8, 0) NULL ,
	[TestigoEntrega] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[TestigoRecibe] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[UnidadTestigoEntrega] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[UnidadTestigoRecibe] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[PuestoTestigoEntrega] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[PuestoTestigoRecibe] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[DireccionTestigoEntrega] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[DireccionTestigoRecibe] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[ResponsableOrgano] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[ResponsableCoordinacion] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[ResponsableSecretaria] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[PuestoRepresentante] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[HoraConclusionActa] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaFirma] [numeric](8, 0) NULL ,
	[TipoActa] [tinyint] NULL ,
	[Observaciones] [ntext] COLLATE Modern_Spanish_CI_AS NULL ,
	[NombreExpide] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[PuestoExpide] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[ArchivoAnexo] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[DetalleAnexo1I] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Integracion] [ntext] COLLATE Modern_Spanish_CI_AS NULL ,
	[ActasSesion] [ntext] COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[DetalleAnexo2IV1] (
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[NombreFirma] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Cargo] [varchar] (100) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DetalleAnexo2IV3] (
	[IdRenglon] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[NombreFirma] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Cargo] [varchar] (100) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Enlace] (
	[IdEnlace] [numeric](3, 0) NOT NULL ,
	[Nombre] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[ApePaterno] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[ApeMaterno] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[IdUsuario] [numeric](6, 0) NULL ,
	[IdUnidadGobierno] [numeric](3, 0) NULL ,
	[TipoUsuario] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[EntregaEstatus] (
	[IdFuncionario] [numeric](6, 0) NULL ,
	[Estatus] [char] (1) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Fecha] [nvarchar] (14) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo1II] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[IdTipo] [numeric](3, 0) NULL ,
	[Numero] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FechaSuscripcion] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Duracion] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Descripcion] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ImporteTotal] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Entidad] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Observaciones] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo2III] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[NumeroOficio] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fecha] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Concepto] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observaciones] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo2IV] (
	[IdFuncionario] [numeric](6, 0) NULL ,
	[NombreInstitucion] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[NoCuenta] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[TipoInversion] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Saldo] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaVencimiento] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo2IV1] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[NoCuenta] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Nombre] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Chequera] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Banco] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Inicial] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Final] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Numero] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Fecha] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo2IV2] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Fecha] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NoCuenta] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Banco] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Beneficiario] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NoCheque] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo2IV3] (
	[IdFuncionario] [numeric](6, 0) NULL ,
	[Fecha] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NoCuenta] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NombreInstitucion] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TipoInversion] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Vencimiento] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Saldo] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo2V] (
	[IdFuncionario] [numeric](6, 0) NULL ,
	[NumeroDocumento] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[NombreDeudor] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Concepto] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaVencimiento] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Saldo] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo2VI] (
	[IdFuncionario] [numeric](6, 0) NULL ,
	[NumeroDocumento] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[NombreAcreedor] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Concepto] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaVencimiento] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Saldo] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3IV1] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Nombre] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Puesto] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Categoria] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Adscripcion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[TipoPlaza] [nvarchar] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[SueldoBase] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Compensacion] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[OtrasPrestaciones] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3IV1RH] (
	[UsuarioRH] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Nombre] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Puesto] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Categoria] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Adscripcion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[TipoPlaza] [nvarchar] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[SueldoBase] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Compensacion] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[OtrasPrestaciones] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[ClaveTipoNomina] [nvarchar] (2) COLLATE Modern_Spanish_CI_AS NULL ,
	[IdUnidadAdministrativa] [nvarchar] (4) COLLATE Modern_Spanish_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3IV2] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Nomina] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Nombre] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Situacion] [nvarchar] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[ComisionadoDE] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[ComisionadoA] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[PeriodoDE] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[PeriodoA] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3IV2RH] (
	[UsuarioRH] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Nomina] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Nombre] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Situacion] [nvarchar] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[ComisionadoDE] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[ComisionadoA] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[PeriodoDE] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[PeriodoA] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[ClaveTipoNomina] [nvarchar] (2) COLLATE Modern_Spanish_CI_AS NULL ,
	[IdUnidadAdministrativa] [nvarchar] (4) COLLATE Modern_Spanish_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3IV5] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[NoEmpleado] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Nombre] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Puesto] [varchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[UAdministrativa] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3IV5RH] (
	[UsuarioRH] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[NoEmpleado] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Nombre] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Puesto] [varchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[UAdministrativa] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[ClaveTipoNomina] [nvarchar] (2) COLLATE Modern_Spanish_CI_AS NULL ,
	[IdUnidadAdministrativa] [nvarchar] (4) COLLATE Modern_Spanish_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3IX] (
	[IdFuncionario] [numeric](6, 0) NULL ,
	[NoExpediente] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[NoProgresivo] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Nombre] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Destino] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[EstadoInmueble] [nvarchar] (4) COLLATE Modern_Spanish_CI_AS NULL ,
	[TipoInmueble] [nvarchar] (4) COLLATE Modern_Spanish_CI_AS NULL ,
	[TipoAccion] [nvarchar] (4) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observaciones] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3V1] (
	[IdFuncionario] [numeric](6, 0) NULL ,
	[NoInventario] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Descripcion] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Marca] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Modelo] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Serie] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Valor] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Ubicacion] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Resguardante] [varchar] (150) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [varchar] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3V2] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Clave] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[NumFactura] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fecha] [varchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Concepto] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [varchar] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3V3] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Clave] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[NumFactura] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fecha] [varchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Concepto] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [varchar] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3V4] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[NoInventario] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[NoEconomico] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Marca] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Modelo] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Color] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Placas] [nvarchar] (15) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [nvarchar] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[Serie] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Resguardante] [nvarchar] (150) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3V5] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Clave] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Calibre] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Matricula] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Nombre] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Cargo] [varchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3V6] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Clave] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[NumFactura] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fecha] [varchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Concepto] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [varchar] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3V7] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Titulo] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Fecha] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Autores] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Nombre] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Departamento] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Tipo] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3VI] (
	[IdFuncionario] [numeric](6, 0) NULL ,
	[NoNombre] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Unidad] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[PrecioUnitario] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Existencia] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3X] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Clave] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Programa] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MontoAprobado] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MontoEjercido] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FechaInicial] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaFinal] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[AvanceFisico] [nvarchar] (5) COLLATE Modern_Spanish_CI_AS NULL ,
	[AvanceFinanciero] [nvarchar] (5) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[TipoOrigen] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3XI] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Clave] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Programa] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[NoAprobacion] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[InversionAprobada] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InversionEjercida] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ObrasEntregadas] [nvarchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ObrasPorEntregar] [nvarchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[UnidadMedida] [nvarchar] (30) COLLATE Modern_Spanish_CI_AS NULL ,
	[CantidadTotal] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[TipoOrigen] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3XII] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Clave] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Obra] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NoContrato] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NombreContratista] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CostoTotal] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AnticipoOtorgado] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AnticipoAmortizado] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TipoOrigen] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SaldoAnticipoAmortizar] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3XV] (
	[IdFuncionario] [numeric](6, 0) NULL ,
	[Identificacion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Expediente] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Periodo] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Ubicacion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Documento] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3XVI] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Identificacion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Expediente] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Periodo] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Ubicacion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Documento] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ErrAnexo3XVII] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Expediente] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Asunto] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FechaInicio] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Situacion] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FechaSolucion] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DescripcionError] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Funcionario] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Nombre] [nvarchar] (30) COLLATE Modern_Spanish_CI_AS NULL ,
	[ApePaterno] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[ApeMaterno] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[IdUsuario] [numeric](6, 0) NULL ,
	[IdCargo] [numeric](4, 0) NOT NULL ,
	[FecIni] [numeric](8, 0) NULL ,
	[FecFin] [numeric](8, 0) NULL ,
	[Email] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[MaxUsuarios] [int] NULL ,
	[Estatus] [char] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[IdFuncionarioAnt] [numeric](5, 0) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Historico] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Nombre] [varchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Cargo] [varchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[UnidadAdministrativa] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Ruta1] [varchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Ruta2] [varchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fecha] [varchar] (18) COLLATE Modern_Spanish_CI_AS NULL ,
	[ArchivoZip] [varchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Proceso] [char] (1) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Observaciones] [text] COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[HistoricoAvance] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Proceso] [char] (1) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[IdFuncionarioNvo] [numeric](6, 0) NOT NULL ,
	[Avance] [varchar] (150) COLLATE Modern_Spanish_CI_AS NULL ,
	[EnProceso] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Mensaje] (
	[IdRenglon] [numeric](4, 0) IDENTITY (1, 1) NOT NULL ,
	[Mensaje] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FechaIni] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[FechaFin] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MensajeRH] (
	[IdRenglon] [numeric](4, 0) IDENTITY (1, 1) NOT NULL ,
	[IdUnidadGobierno] [numeric](3, 0) NOT NULL ,
	[IdUnidadAdministrativa] [numeric](4, 0) NOT NULL ,
	[TipoMov] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ValorAnterior] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Leido] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Municipio] (
	[IdMunicipio] [numeric](6, 0) IDENTITY (1, 1) NOT NULL ,
	[Nombre] [nvarchar] (30) COLLATE Modern_Spanish_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo1II] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[IdTipo] [numeric](3, 0) NULL ,
	[Numero] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FechaSuscripcion] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Duracion] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Descripcion] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ImporteTotal] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Entidad] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Observaciones] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo2III] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[NumeroOficio] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fecha] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Concepto] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observaciones] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo2IV] (
	[IdFuncionario] [numeric](6, 0) NULL ,
	[NombreInstitucion] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[NoCuenta] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[TipoInversion] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Saldo] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaVencimiento] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo2IV1] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[NoCuenta] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Nombre] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Chequera] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Banco] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Inicial] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Final] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Numero] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Fecha] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo2IV2] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Fecha] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NoCuenta] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Banco] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Beneficiario] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NoCheque] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo2IV3] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Fecha] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NoCuenta] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NombreInstitucion] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TipoInversion] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Vencimiento] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Saldo] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo2V] (
	[IdFuncionario] [numeric](6, 0) NULL ,
	[NumeroDocumento] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[NombreDeudor] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Concepto] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaVencimiento] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Saldo] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo2VI] (
	[IdFuncionario] [numeric](6, 0) NULL ,
	[NumeroDocumento] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[NombreAcreedor] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Concepto] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaVencimiento] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Saldo] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3IV1] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Nombre] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Puesto] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Categoria] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Adscripcion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[TipoPlaza] [nvarchar] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[SueldoBase] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Compensacion] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[OtrasPrestaciones] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3IV1RH] (
	[UsuarioRH] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Nombre] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Puesto] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Categoria] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Adscripcion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[TipoPlaza] [nvarchar] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[SueldoBase] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Compensacion] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[OtrasPrestaciones] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[ClaveTipoNomina] [nvarchar] (2) COLLATE Modern_Spanish_CI_AS NULL ,
	[IdUnidadAdministrativa] [nvarchar] (4) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3IV2] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Nomina] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Nombre] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Situacion] [nvarchar] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[ComisionadoDE] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[ComisionadoA] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[PeriodoDE] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[PeriodoA] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3IV2RH] (
	[UsuarioRH] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Nomina] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Nombre] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Situacion] [nvarchar] (1) COLLATE Modern_Spanish_CI_AS NULL ,
	[ComisionadoDE] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[ComisionadoA] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[PeriodoDE] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[PeriodoA] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[ClaveTipoNomina] [nvarchar] (2) COLLATE Modern_Spanish_CI_AS NULL ,
	[IdUnidadAdministrativa] [nvarchar] (4) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3IV5] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[NoEmpleado] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Nombre] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Puesto] [varchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[UAdministrativa] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3IV5RH] (
	[UsuarioRH] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[NoEmpleado] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Nombre] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Puesto] [varchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[UAdministrativa] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[ClaveTipoNomina] [nvarchar] (2) COLLATE Modern_Spanish_CI_AS NULL ,
	[IdUnidadAdministrativa] [nvarchar] (4) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3IX] (
	[IdFuncionario] [numeric](6, 0) NULL ,
	[NoExpediente] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[NoProgresivo] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Nombre] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Destino] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[EstadoInmueble] [nvarchar] (4) COLLATE Modern_Spanish_CI_AS NULL ,
	[TipoInmueble] [nvarchar] (4) COLLATE Modern_Spanish_CI_AS NULL ,
	[TipoAccion] [nvarchar] (4) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observaciones] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3V1] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[NoInventario] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Descripcion] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Marca] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Modelo] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Serie] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Valor] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Ubicacion] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Resguardante] [varchar] (150) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [varchar] (1) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3V2] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Clave] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[NumFactura] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fecha] [varchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Concepto] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [varchar] (1) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3V3] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Clave] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[NumFactura] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fecha] [varchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Concepto] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [varchar] (1) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3V4] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[NoInventario] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[NoEconomico] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Marca] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Modelo] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Color] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Placas] [nvarchar] (15) COLLATE Modern_Spanish_CI_AS NULL ,
	[Serie] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Resguardante] [nvarchar] (150) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [nvarchar] (1) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3V5] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Clave] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Calibre] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Matricula] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Nombre] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Cargo] [varchar] (100) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3V6] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Clave] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[NumFactura] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Fecha] [varchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[Concepto] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [varchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [varchar] (1) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3V7] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Titulo] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Fecha] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Autores] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Nombre] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Departamento] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Tipo] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3VI] (
	[IdFuncionario] [numeric](6, 0) NULL ,
	[NoNombre] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Unidad] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[PrecioUnitario] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Existencia] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Importe] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3X] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Clave] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Programa] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[Tipo] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MontoAprobado] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MontoEjercido] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FechaInicial] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[FechaFinal] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[AvanceFisico] [nvarchar] (5) COLLATE Modern_Spanish_CI_AS NULL ,
	[AvanceFinanciero] [nvarchar] (5) COLLATE Modern_Spanish_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[TipoOrigen] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3XI] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Clave] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[Programa] [nvarchar] (100) COLLATE Modern_Spanish_CI_AS NULL ,
	[NoAprobacion] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[InversionAprobada] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InversionEjercida] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[UnidadMedida] [nvarchar] (30) COLLATE Modern_Spanish_CI_AS NULL ,
	[CantidadTotal] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL ,
	[ObrasEntregadas] [nvarchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ObrasPorEntregar] [nvarchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[TipoOrigen] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3XII] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Clave] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Obra] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NoContrato] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NombreContratista] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CostoTotal] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AnticipoOtorgado] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AnticipoAmortizado] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SaldoAnticipoAmortizar] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Observacion] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TipoOrigen] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3XV] (
	[IdFuncionario] [numeric](6, 0) NULL ,
	[Identificacion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Expediente] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Periodo] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Ubicacion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Documento] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3XVI] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Identificacion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Expediente] [nvarchar] (255) COLLATE Modern_Spanish_CI_AS NULL ,
	[Periodo] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Ubicacion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL ,
	[Documento] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PasoAnexo3XVII] (
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Expediente] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Asunto] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FechaInicio] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Situacion] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FechaSolucion] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ResumenAnexo3iv1RH] (
	[UsuarioRH] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[IdUnidadGobierno] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[IdUnidadAdministrativa] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[RegACargar] [numeric](6, 0) NULL ,
	[RegError] [numeric](6, 0) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ResumenAnexo3iv2RH] (
	[UsuarioRH] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[IdUnidadGobierno] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[IdUnidadAdministrativa] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[RegACargar] [numeric](6, 0) NULL ,
	[RegError] [numeric](6, 0) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ResumenAnexo3iv5RH] (
	[UsuarioRH] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[IdUnidadGobierno] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[IdUnidadAdministrativa] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[RegACargar] [numeric](6, 0) NULL ,
	[RegError] [numeric](6, 0) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Sesion] (
	[IdSesion] [int] NOT NULL ,
	[IdUsuario] [numeric](6, 0) NOT NULL ,
	[Fecha] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[DireccionIP] [nvarchar] (15) COLLATE Modern_Spanish_CI_AS NULL ,
	[Estatus] [char] (1) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[FechaCierre] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TipoDocumento] (
	[IdTipo] [numeric](3, 0) NOT NULL ,
	[Nombre] [varchar] (50) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TipoNomina] (
	[IdTipoNomina] [int] IDENTITY (1, 1) NOT NULL ,
	[Clave] [nvarchar] (2) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Descripcion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[UnidadAdministrativa] (
	[IdUnidadAdministrativa] [numeric](4, 0) IDENTITY (1, 1) NOT NULL ,
	[IdUnidadGobierno] [numeric](3, 0) NOT NULL ,
	[Direccion] [nvarchar] (50) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[IdMunicipio] [numeric](6, 0) NOT NULL ,
	[Nombre] [nvarchar] (60) COLLATE Modern_Spanish_CI_AS NULL ,
	[Clave] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[UnidadGobierno] (
	[IdUnidadGobierno] [numeric](3, 0) IDENTITY (1, 1) NOT NULL ,
	[Nombre] [nvarchar] (120) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[TipoUnidad] [char] (1) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Imagen] [nvarchar] (150) COLLATE Modern_Spanish_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Usuario] (
	[IdUsuario] [numeric](6, 0) NOT NULL ,
	[Usuario] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Clave] [nvarchar] (10) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[TipoUsuario] [char] (1) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[Estatus] [char] (1) COLLATE Modern_Spanish_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[UsuarioAnexo] (
	[IdAnexo] [numeric](2, 0) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[IdUsuarioLimitado] [numeric](4, 0) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[UsuarioLimitado] (
	[IdUsuarioLimitado] [numeric](4, 0) NOT NULL ,
	[IdFuncionario] [numeric](6, 0) NOT NULL ,
	[Nombre] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[ApePaterno] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[ApeMaterno] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[FecIni] [numeric](8, 0) NULL ,
	[FecFin] [numeric](8, 0) NULL ,
	[IdUsuario] [numeric](6, 0) NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[UsuarioRH] (
	[IdUsuarioRH] [numeric](4, 0) NOT NULL ,
	[Nombre] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NOT NULL ,
	[ApePaterno] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[ApeMaterno] [nvarchar] (20) COLLATE Modern_Spanish_CI_AS NULL ,
	[IdUsuario] [numeric](6, 0) NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Adendum] WITH NOCHECK ADD 
	CONSTRAINT [PK_Adendum] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo] WITH NOCHECK ADD 
	CONSTRAINT [PK_ANEXO] PRIMARY KEY  CLUSTERED 
	(
		[IdAnexo]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo1I] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo1I] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo1II] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo1II] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo2I] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo2I] PRIMARY KEY  CLUSTERED 
	(
		[IdFuncionario]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo2II] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo2II] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo2III] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo2III] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo2IV] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo2IV] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo2IV1] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo2IV1] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo2IV2] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo2IV2] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo2IV3] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo2IV3] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo2V] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo2V] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo2VI] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo2VI] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo2VII] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo2VII] PRIMARY KEY  CLUSTERED 
	(
		[IdFuncionario]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3I] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3I] PRIMARY KEY  CLUSTERED 
	(
		[IdFuncionario]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3II] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3II] PRIMARY KEY  CLUSTERED 
	(
		[IdFuncionario]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3III] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3III] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3IV] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3IV] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3IV4] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3IV4] PRIMARY KEY  CLUSTERED 
	(
		[IdFuncionario],
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3IV5] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3IV5] PRIMARY KEY  CLUSTERED 
	(
		[IdFuncionario],
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3IV6] WITH NOCHECK ADD 
	CONSTRAINT [PK_ANEXO3IV6] PRIMARY KEY  CLUSTERED 
	(
		[IdCurso],
		[IdEmpleado]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3IV6Curso] WITH NOCHECK ADD 
	CONSTRAINT [PK_ANEXO3IV6CURSOS] PRIMARY KEY  CLUSTERED 
	(
		[IdCurso]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3IV6Empleado] WITH NOCHECK ADD 
	CONSTRAINT [PK_ANEXOIV6EMPLEADOS] PRIMARY KEY  CLUSTERED 
	(
		[IdEmpleado]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3IX] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3IX] PRIMARY KEY  CLUSTERED 
	(
		[IdAnexo3IX]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3V1] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3V1] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3V2] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3V2] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3V2I] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3V2I] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3V2II] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3V2II] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3V3] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3V3] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3V4] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3V4] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3V5] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3V5] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3V6] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3V6] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3V7] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3V7] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3VI] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3VI] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3VII] WITH NOCHECK ADD 
	CONSTRAINT [PK_ANEXO3VII] PRIMARY KEY  CLUSTERED 
	(
		[IdAnexo3VII]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3X] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3X] PRIMARY KEY  CLUSTERED 
	(
		[IdAnexo3X]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3XII] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3XII] PRIMARY KEY  CLUSTERED 
	(
		[IdAnexo3XII]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3XIII] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3XIII] PRIMARY KEY  CLUSTERED 
	(
		[IdAnexo3XIII]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3XV] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3XV] PRIMARY KEY  CLUSTERED 
	(
		[IdAnexo3XV]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3XVIII] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3XVIII_1] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3XVIIITmp] WITH NOCHECK ADD 
	CONSTRAINT [PK_Anexo3XVIII] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[AnexoArchivo] WITH NOCHECK ADD 
	CONSTRAINT [PK_ANEXOARCHIVO] PRIMARY KEY  CLUSTERED 
	(
		[IdAnexoArchivo]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[AnexoEstatus] WITH NOCHECK ADD 
	CONSTRAINT [PK_ANEXOSXML] PRIMARY KEY  CLUSTERED 
	(
		[IdAnexo],
		[IdFuncionario]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Cargo] WITH NOCHECK ADD 
	CONSTRAINT [PK_CARGO] PRIMARY KEY  CLUSTERED 
	(
		[IdCargo]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[DetalleAnexo2IV1] WITH NOCHECK ADD 
	CONSTRAINT [PK_DetalleAnexo2IV1] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Funcionario] WITH NOCHECK ADD 
	CONSTRAINT [PK_FUNCIONARIO] PRIMARY KEY  CLUSTERED 
	(
		[IdFuncionario]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MensajeRH] WITH NOCHECK ADD 
	CONSTRAINT [PK_MensajeRH] PRIMARY KEY  CLUSTERED 
	(
		[IdRenglon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Municipio] WITH NOCHECK ADD 
	CONSTRAINT [PK_MUNICIPIO] PRIMARY KEY  CLUSTERED 
	(
		[IdMunicipio]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Sesion] WITH NOCHECK ADD 
	CONSTRAINT [PK_Acceso] PRIMARY KEY  CLUSTERED 
	(
		[IdSesion]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TipoNomina] WITH NOCHECK ADD 
	CONSTRAINT [PK_TipoNomina] PRIMARY KEY  CLUSTERED 
	(
		[IdTipoNomina]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[UnidadAdministrativa] WITH NOCHECK ADD 
	CONSTRAINT [PK_UNIDADADMINISTRATIVA] PRIMARY KEY  CLUSTERED 
	(
		[IdUnidadAdministrativa]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[UnidadGobierno] WITH NOCHECK ADD 
	CONSTRAINT [PK_UNIDADGOBIERNO] PRIMARY KEY  CLUSTERED 
	(
		[IdUnidadGobierno]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Usuario] WITH NOCHECK ADD 
	CONSTRAINT [PK_USUARIO] PRIMARY KEY  CLUSTERED 
	(
		[IdUsuario]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[UsuarioAnexo] WITH NOCHECK ADD 
	CONSTRAINT [PK_UsuarioAnexo] PRIMARY KEY  CLUSTERED 
	(
		[IdAnexo],
		[IdFuncionario]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[UsuarioLimitado] WITH NOCHECK ADD 
	CONSTRAINT [PK_USUARIOLIMITADO] PRIMARY KEY  CLUSTERED 
	(
		[IdUsuarioLimitado]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Anexo3XVIIIBak] WITH NOCHECK ADD 
	CONSTRAINT [DF__Anexo3XVI__Fecha__0A537D18] DEFAULT (getdate()) FOR [FechaSYS]
GO

ALTER TABLE [dbo].[TipoNomina] WITH NOCHECK ADD 
	CONSTRAINT [IX_TipoNomina] UNIQUE  NONCLUSTERED 
	(
		[Clave]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[UnidadGobierno] WITH NOCHECK ADD 
	CONSTRAINT [CKC_TIPOUNIDAD_UNIDADGO] CHECK ([TipoUnidad] = '3' or [TipoUnidad] = '2' or [TipoUnidad] = '1')
GO

ALTER TABLE [dbo].[Usuario] WITH NOCHECK ADD 
	CONSTRAINT [CKC_TIPOUSUARIO_USUARIO] CHECK ([TipoUsuario] = '7' or [TipoUsuario] = '6' or [TipoUsuario] = '5' or [TipoUsuario] = '4' or [TipoUsuario] = '3' or [TipoUsuario] = '2' or [TipoUsuario] = '1')
GO

 CREATE  INDEX [IX_Anexo1II_Func] ON [dbo].[Anexo1II]([IdFuncionario], [Numero], [IdTipo], [FechaSuscripcion]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo2III_Func] ON [dbo].[Anexo2III]([IdFuncionario], [NumeroOficio], [Fecha]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo2IV_Func] ON [dbo].[Anexo2IV]([IdFuncionario], [NombreInstitucion], [NoCuenta], [FechaVencimiento]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo2IV1_Func] ON [dbo].[Anexo2IV1]([IdFuncionario], [NoCuenta], [Nombre], [Chequera]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo2IV2_Func] ON [dbo].[Anexo2IV2]([IdFuncionario], [NoCheque], [Banco], [Beneficiario]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo2IV3_Func] ON [dbo].[Anexo2IV3]([IdFuncionario], [NoCuenta], [NombreInstitucion], [Fecha]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo2V_Func] ON [dbo].[Anexo2V]([IdFuncionario], [NumeroDocumento], [NombreDeudor], [FechaVencimiento]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo2VI_Func] ON [dbo].[Anexo2VI]([IdFuncionario], [NumeroDocumento], [NombreAcreedor], [FechaVencimiento]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo3IV1_Func] ON [dbo].[Anexo3IV1]([IdFuncionario], [ClaveTipoNomina], [Observaciones], [Nombre]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo3IV2_Func] ON [dbo].[Anexo3IV2]([IdFuncionario], [ClaveTipoNomina], [Nomina], [Nombre]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo3IV5_Func] ON [dbo].[Anexo3IV5]([IdFuncionario], [ClaveTipoNomina], [Numero], [Nombre]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo3IV6_CursoEmpleado] ON [dbo].[Anexo3IV6]([IdCurso], [IdEmpleado]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo3IX_Func] ON [dbo].[Anexo3IX]([IdFuncionario], [NoExpediente], [NoProgresivo], [Nombre]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo3V1_Func] ON [dbo].[Anexo3V1]([IdFuncionario], [Resguardante], [NoInventario]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo3V2_Func] ON [dbo].[Anexo3V2]([IdFuncionario], [Clave], [NumFactura]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo3V3_Func] ON [dbo].[Anexo3V3]([IdFuncionario], [Clave], [NumFactura]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo3V4_Func] ON [dbo].[Anexo3V4]([IdFuncionario], [Resguardante], [NoInventario]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo3V5_Func] ON [dbo].[Anexo3V5]([IdFuncionario], [Clave], [Calibre]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo3V6_Func] ON [dbo].[Anexo3V6]([IdFuncionario], [Clave], [NumFactura]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo3V7_Func] ON [dbo].[Anexo3V7]([IdFuncionario], [Titulo], [Fecha], [Autores]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo3VI_Func] ON [dbo].[Anexo3VI]([IdFuncionario], [NoNombre], [Unidad]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo3X_Func] ON [dbo].[Anexo3X]([IdFuncionario], [TipoOrigen], [Clave], [Programa]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo3XI_Func] ON [dbo].[Anexo3XI]([IdFuncionario], [TipoOrigen], [Clave], [Programa]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo3XII_Func] ON [dbo].[Anexo3XII]([IdFuncionario], [TipoOrigen], [Clave], [Obra]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo3XV_Func] ON [dbo].[Anexo3XV]([IdFuncionario], [Ubicacion], [Identificacion]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo3XVI_Func] ON [dbo].[Anexo3XVI]([IdFuncionario], [Ubicacion], [Identificacion], [Expediente]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Anexo3XVII_Func] ON [dbo].[Anexo3XVII]([IdFuncionario], [Expediente], [Asunto], [FechaInicio]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Anexo3IV1] ADD 
	CONSTRAINT [FK_Anexo3IV1_TipoNomina] FOREIGN KEY 
	(
		[ClaveTipoNomina]
	) REFERENCES [dbo].[TipoNomina] (
		[Clave]
	) ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[Anexo3IV2] ADD 
	CONSTRAINT [FK_Anexo3IV2_TipoNomina] FOREIGN KEY 
	(
		[ClaveTipoNomina]
	) REFERENCES [dbo].[TipoNomina] (
		[Clave]
	) ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[Anexo3IV5] ADD 
	CONSTRAINT [FK_Anexo3IV5_TipoNomina] FOREIGN KEY 
	(
		[ClaveTipoNomina]
	) REFERENCES [dbo].[TipoNomina] (
		[Clave]
	) ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[Anexo3IV6] ADD 
	CONSTRAINT [FK_ANEXO3IVa] FOREIGN KEY 
	(
		[IdCurso]
	) REFERENCES [dbo].[Anexo3IV6Curso] (
		[IdCurso]
	),
	CONSTRAINT [FK_ANEXO3IVb] FOREIGN KEY 
	(
		[IdEmpleado]
	) REFERENCES [dbo].[Anexo3IV6Empleado] (
		[IdEmpleado]
	)
GO

ALTER TABLE [dbo].[Anexo3IV6Curso] ADD 
	CONSTRAINT [FK_ANEXO3IV] FOREIGN KEY 
	(
		[IdFuncionario]
	) REFERENCES [dbo].[Funcionario] (
		[IdFuncionario]
	)
GO

ALTER TABLE [dbo].[Anexo3IV6Empleado] ADD 
	CONSTRAINT [FK_ANEXOIV6_REFERENCE_FUNCIONA] FOREIGN KEY 
	(
		[IdFuncionario]
	) REFERENCES [dbo].[Funcionario] (
		[IdFuncionario]
	)
GO

ALTER TABLE [dbo].[Anexo3VII] ADD 
	CONSTRAINT [FK_ANEXO3VI_REFERENCE_FUNCIONA] FOREIGN KEY 
	(
		[IdFuncionario]
	) REFERENCES [dbo].[Funcionario] (
		[IdFuncionario]
	)
GO

ALTER TABLE [dbo].[AnexoArchivo] ADD 
	CONSTRAINT [FK_ANEXOARC_REFERENCE_FUNCIONA] FOREIGN KEY 
	(
		[IdFuncionario]
	) REFERENCES [dbo].[Funcionario] (
		[IdFuncionario]
	)
GO

ALTER TABLE [dbo].[AnexoEstatus] ADD 
	CONSTRAINT [FK_ANEXOS1] FOREIGN KEY 
	(
		[IdFuncionario]
	) REFERENCES [dbo].[Funcionario] (
		[IdFuncionario]
	),
	CONSTRAINT [FK_ANEXOSXM_REFERENCE_ANEXO] FOREIGN KEY 
	(
		[IdAnexo]
	) REFERENCES [dbo].[Anexo] (
		[IdAnexo]
	)
GO

ALTER TABLE [dbo].[Cargo] ADD 
	CONSTRAINT [FK_CARGO2] FOREIGN KEY 
	(
		[IdUnidadAdministrativa]
	) REFERENCES [dbo].[UnidadAdministrativa] (
		[IdUnidadAdministrativa]
	)
GO

ALTER TABLE [dbo].[DatosGeneralesActa] ADD 
	CONSTRAINT [FK_DATOSGEN1] FOREIGN KEY 
	(
		[IdFuncionario]
	) REFERENCES [dbo].[Funcionario] (
		[IdFuncionario]
	)
GO

ALTER TABLE [dbo].[Funcionario] ADD 
	CONSTRAINT [FK_Funcionario_Usuario] FOREIGN KEY 
	(
		[IdUsuario]
	) REFERENCES [dbo].[Usuario] (
		[IdUsuario]
	),
	CONSTRAINT [FK_FUNCIONARIO2] FOREIGN KEY 
	(
		[IdCargo]
	) REFERENCES [dbo].[Cargo] (
		[IdCargo]
	)
GO

ALTER TABLE [dbo].[UnidadAdministrativa] ADD 
	CONSTRAINT [FK_UNIDADAD2] FOREIGN KEY 
	(
		[IdMunicipio]
	) REFERENCES [dbo].[Municipio] (
		[IdMunicipio]
	),
	CONSTRAINT [FK_UnidadAdministrativa_UnidadGobierno] FOREIGN KEY 
	(
		[IdUnidadGobierno]
	) REFERENCES [dbo].[UnidadGobierno] (
		[IdUnidadGobierno]
	)
GO

ALTER TABLE [dbo].[UsuarioAnexo] ADD 
	CONSTRAINT [FK_USUARIOA_REFERENCE_ANEXO] FOREIGN KEY 
	(
		[IdAnexo]
	) REFERENCES [dbo].[Anexo] (
		[IdAnexo]
	),
	CONSTRAINT [FK_USUARIOA_REFERENCE_FUNCIONA] FOREIGN KEY 
	(
		[IdFuncionario]
	) REFERENCES [dbo].[Funcionario] (
		[IdFuncionario]
	),
	CONSTRAINT [FK_USUARIOA_REFERENCE_USUARIOL] FOREIGN KEY 
	(
		[IdUsuarioLimitado]
	) REFERENCES [dbo].[UsuarioLimitado] (
		[IdUsuarioLimitado]
	)
GO

ALTER TABLE [dbo].[UsuarioLimitado] ADD 
	CONSTRAINT [FK_USUARIOLIM1] FOREIGN KEY 
	(
		[IdFuncionario]
	) REFERENCES [dbo].[Funcionario] (
		[IdFuncionario]
	),
	CONSTRAINT [FK_USUARIOLIM2] FOREIGN KEY 
	(
		[IdUsuario]
	) REFERENCES [dbo].[Usuario] (
		[IdUsuario]
	)
GO

ALTER TABLE [dbo].[UsuarioRH] ADD 
	CONSTRAINT [FK_USUARIORH1] FOREIGN KEY 
	(
		[IdUsuario]
	) REFERENCES [dbo].[Usuario] (
		[IdUsuario]
	)
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE CONSULTA_USUARIO (@sUSUARIO nvarchar(5)) AS 
DECLARE @pIdUsuario   numeric  (5)
DECLARE @pClave       nvarchar (10)
DECLARE @pTipoUsuario char     (1)
DECLARE @pEstatus     char     (1)
SET @sUSUARIO = UPPER(@sUSUARIO)
SELECT @pIdUsuario = IdUsuario, @pClave = Clave, @pTipoUsuario = TipoUsuario, @pEstatus = Estatus 
FROM Usuario WHERE UPPER(Usuario) = @sUSUARIO
IF @pTipoUsuario = '1' 
select @sUSUARIO Usuario, @pClave Clave, @pEstatus Estatus
IF @pTipoUsuario = '2' 
select @sUSUARIO Usuario, a.IdFuncionario, a.Nombre, ApePaterno, ApeMaterno, b.nombre Cargo, c.nombre UnidadAdministrativa, d.nombre Dependencia, @pClave Clave, @pEstatus Estatus
from funcionario a, cargo b, unidadadministrativa c, unidadgobierno d
where a.idcargo = b.idcargo and b.idUnidadAdministrativa = c.idUnidadAdministrativa 
and c.idUnidadGobierno = d.idUnidadGobierno and a.idusuario = @pIdUsuario
IF @pTipoUsuario = '4' OR @pTipoUsuario = '5' 
select @sUSUARIO Usuario, a.IdEnlace, a.Nombre, ApePaterno, ApeMaterno, b.nombre Dependencia, @pClave Clave, @pEstatus Estatus
from enlace a, unidadgobierno b
where a.idunidadgobierno = b.idunidadgobierno 
and a.idusuario = @pIdUsuario
IF @pTipoUsuario = '3' 
select @sUSUARIO Usuario, a.Nombre, a.ApePaterno, a.ApeMaterno, b.IdFuncionario, b.Nombre + ' ' + b.ApePaterno + ' ' + b.ApeMaterno Funcionario, c.nombre, d.nombre UnidadAdministrativa, e.nombre Dependencia, @pClave Clave, @pEstatus Estatus
from usuarioLimitado a, funcionario b, cargo c, unidadadministrativa d, unidadgobierno e
where a.idFuncionario = b.idFuncionario
and b.idcargo = c.idcargo and c.idUnidadAdministrativa = d.idUnidadAdministrativa 
and d.idUnidadGobierno = e.idUnidadGobierno and a.idusuario = @pIdUsuario


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE  PROCEDURE [CargaAnexo1II](@IdFuncionario  numeric)
AS 
    DECLARE @IdTipo char(1),     @Numero varchar(255),	@FechaSuscripcion varchar(10)
    DECLARE @Duracion varchar(50),  @Descripcion varchar(255), 	@ImporteTotal varchar(20)
    DECLARE @Entidad varchar(255),  @Observaciones varchar(255)
    DECLARE @RegACargar numeric(6), @RegError numeric(6)
    DECLARE @DescripcionError varchar(255), @bFlag bit
    DECLARE @nImporte numeric(22,2)
    SET NOCOUNT ON 
    --PRINT 'ANEXO1II'
    UPDATE Anexo1ii SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario

    DECLARE Carga CURSOR  
        FOR SELECT	IdTipo, Numero, FechaSuscripcion, Duracion, Descripcion, ImporteTotal, Entidad, Observaciones
        FROM		PasoAnexo1II
        WHERE	IdFuncionario = @IdFuncionario
    
    SET @RegACargar = 0
    SET @RegError = 0

    DELETE ErrAnexo1II WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @IdTipo, @Numero, @FechaSuscripcion, @Duracion, @Descripcion, @ImporteTotal, @Entidad, @Observaciones
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        SET @bFlag = 0 

        IF @IdTipo <> '1' AND @IdTipo <> '2' AND @IdTipo <> '3' AND @IdTipo <> '4'
        BEGIN
            SET @DescripcionError = 'Tipo debe ser 1, 2, 3 o 4'
            SET @bFlag = 1
        END

        IF LTRIM(@ImporteTotal) = '' SET @ImporteTotal = '0'
        SET @ImporteTotal = REPLACE(@ImporteTotal,',','')
        SET @ImporteTotal = REPLACE(@ImporteTotal,'$','')


        IF ISNUMERIC(@ImporteTotal) <> 1 
        BEGIN
            SET @DescripcionError = 'Importe Total Deben ser númerico'
            SET @bFlag = 1
        END
        print @bFlag 
        IF @bFlag = 0 
        BEGIN
            SET @nImporte = CAST(@ImporteTotal AS NUMERIC(22, 2))
            SET @ImporteTotal = substring(ltrim(CAST(@nImporte AS nvarchar(23))),1,20)
            
            INSERT INTO Anexo1II(IdFuncionario, IdTipo, Numero, FechaSuscripcion, Duracion, Descripcion, ImporteTotal, Entidad, Observaciones, UltimaCarga) 
            VALUES(@IdFuncionario, @IdTipo, LTRIM(RTRIM(@Numero)), LTRIM(RTRIM(@FechaSuscripcion)), LTRIM(RTRIM(@Duracion)), LTRIM(RTRIM(@Descripcion)), @ImporteTotal, LTRIM(RTRIM(@Entidad)), LTRIM(RTRIM(@Observaciones)), 1 )
            
            IF (@@ERROR <> 0)
            BEGIN
                SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
                SET @bFlag = 1
            END
        END

        IF @bFlag = 1 
        BEGIN
            SET @RegError = @RegError + 1
            INSERT INTO ErrAnexo1II(IdFuncionario, IdTipo, Numero, FechaSuscripcion, Duracion, Descripcion, ImporteTotal, Entidad, Observaciones, DescripcionError)
            VALUES(@IdFuncionario, @IdTipo, @Numero, @FechaSuscripcion, @Duracion, @Descripcion, @ImporteTotal, @Entidad, @Observaciones, @DescripcionError)
        END
        
        FETCH NEXT FROM Carga INTO @IdTipo, @Numero, @FechaSuscripcion, @Duracion, @Descripcion, @ImporteTotal, @Entidad, @Observaciones              
    END
    DELETE PasoAnexo1II WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE  PROCEDURE [CargaAnexo2III](@IdFuncionario  numeric)
AS 
    DECLARE 	@NumeroOficio varchar(255),	@Fecha varchar(10),	@Concepto varchar(255)
    DECLARE	@Importe varchar(20), 	@Observaciones varchar(255), 	@DescripcionError varchar(255)
    DECLARE 	@RegACargar numeric(6),	@RegError numeric(6)
    DECLARE	@nImporte numeric(22,2)
    SET NOCOUNT ON 
    PRINT 'ANEXO2III'
    UPDATE ANEXO2III SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario
    DECLARE Carga CURSOR  
        FOR SELECT	NumeroOficio, Fecha, Concepto, Importe, Observaciones
        FROM		PasoAnexo2III
        WHERE	IdFuncionario = @IdFuncionario
    
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo2III WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @NumeroOficio, @Fecha, @Concepto, @Importe, @Observaciones
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        IF LTRIM(@Importe) = '' SET @Importe = '0'
        SET @Importe = REPLACE(@Importe,',','')
        SET @Importe = REPLACE(@Importe,'$','')
        IF ISNUMERIC(@Importe) = 1
        BEGIN
            SET @nImporte = CAST(@Importe AS NUMERIC(22, 2))
            SET @Importe = substring(ltrim(CAST(@nImporte AS nvarchar(23))),1,20)
            
      		 INSERT INTO Anexo2III(IdFuncionario, NumeroOficio, Fecha, Concepto, Importe, Observaciones, UltimaCarga) 
       		 VALUES(@IdFuncionario, LTRIM(RTRIM(@NumeroOficio)), LTRIM(RTRIM(@Fecha)), LTRIM(RTRIM(@Concepto)), LTRIM(RTRIM(@Importe)), LTRIM(RTRIM(@Observaciones)), 1 )
       		 IF (@@ERROR <> 0)
       		 BEGIN
           			 SET @RegError = @RegError + 1
          		 	 SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
          		 	 INSERT INTO ErrAnexo2III(IdFuncionario, NumeroOficio, Fecha, Concepto, Importe, Observaciones, DescripcionError) 
        		    	VALUES(@IdFuncionario, @NumeroOficio, @Fecha, @Concepto, @Importe, @Observaciones, @DescripcionError)
       		 END
       END
       ELSE
       BEGIN
            SET @RegError = @RegError + 1
            INSERT INTO ErrAnexo2III(IdFuncionario, NumeroOficio, Fecha, Concepto, Importe, Observaciones, DescripcionError) 
        	VALUES(@IdFuncionario, @NumeroOficio, @Fecha, @Concepto, @Importe, @Observaciones, 'Importe  debe de ser Numérico')
        END
        FETCH NEXT FROM Carga INTO @NumeroOficio, @Fecha, @Concepto, @Importe, @Observaciones
    END
    DELETE PasoAnexo2III WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE  PROCEDURE [CargaAnexo2IV](@IdFuncionario  numeric)
AS 
    DECLARE 	@NombreInstitucion varchar(255),	@NoCuenta varchar(10),	@TipoInversion varchar(255)
    DECLARE	@Saldo varchar(20), 	@FechaVencimiento varchar(255), 	@DescripcionError varchar(255)
    DECLARE 	@RegACargar numeric(6),	@RegError numeric(6)
    DECLARE	@nSaldo numeric(22,2)
    SET NOCOUNT ON 
    PRINT 'ANEXO2IV'
    UPDATE ANEXO2IV SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario
    DECLARE Carga CURSOR  
        FOR SELECT	NombreInstitucion, NoCuenta, TipoInversion, Saldo, FechaVencimiento
        FROM		PasoAnexo2IV
        WHERE	IdFuncionario = @IdFuncionario
    
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo2IV WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @NombreInstitucion, @NoCuenta, @TipoInversion, @Saldo, @FechaVencimiento
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        IF LTRIM(@Saldo) = '' SET @Saldo = '0'
        SET @Saldo = REPLACE(@Saldo,',','')
        SET @Saldo = REPLACE(@Saldo,'$','')
        IF ISNUMERIC(@Saldo) = 1
        BEGIN
           	SET @nSaldo = CAST(@Saldo AS NUMERIC(22, 2))
           	SET @Saldo = substring(ltrim(CAST(@nSaldo AS nvarchar(23))),1,20)
        
        	INSERT INTO Anexo2IV(IdFuncionario, NombreInstitucion, NoCuenta, TipoInversion, Saldo, FechaVencimiento, UltimaCarga) 
       		VALUES(@IdFuncionario, LTRIM(RTRIM(@NombreInstitucion)), LTRIM(RTRIM(@NoCuenta)), LTRIM(RTRIM(@TipoInversion)), LTRIM(RTRIM(@Saldo)), LTRIM(RTRIM(@FechaVencimiento)), 1 )
       		IF (@@ERROR <> 0)
       		BEGIN
           	 	SET @RegError = @RegError + 1
           		 SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
           		 INSERT INTO ErrAnexo2IV(IdFuncionario, NombreInstitucion, NoCuenta, TipoInversion, Saldo, FechaVencimiento, DescripcionError) 
          	 	 VALUES(@IdFuncionario, @NombreInstitucion, @NoCuenta, @TipoInversion, @Saldo, @FechaVencimiento, @DescripcionError)
       		END
        END
       ELSE
       BEGIN
            SET @RegError = @RegError + 1
            INSERT INTO ErrAnexo2IV(IdFuncionario, NombreInstitucion, NoCuenta, TipoInversion, Saldo, FechaVencimiento, DescripcionError) 
            VALUES(@IdFuncionario, @NombreInstitucion, @NoCuenta, @TipoInversion, @Saldo, @FechaVencimiento, 'Saldo debe de ser Numérico')
        END
        FETCH NEXT FROM Carga INTO @NombreInstitucion, @NoCuenta, @TipoInversion, @Saldo, @FechaVencimiento
    END
    DELETE PasoAnexo2IV WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE  PROCEDURE [CargaAnexo2IV1](@IdFuncionario  numeric)
AS 
    DECLARE 	@NoCuenta varchar(50),		@Nombre varchar(100),		@Chequera varchar(20)
    DECLARE	@Banco varchar(20), 		@Inicial varchar(50), 		@Final varchar(50)
    DECLARE	@Numero varchar(50), 		@Fecha varchar(10), 		@Importe varchar(20)
    DECLARE	@DescripcionError varchar(255)
    DECLARE 	@RegACargar numeric(6),	@RegError numeric(6)
    DECLARE	@nImporte numeric(22,2),	@nChequera numeric(22,2),		@nBanco numeric(22,2)
    SET NOCOUNT ON 
    PRINT 'ANEXO2IV1'
    UPDATE ANEXO2IV1 SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario
    DECLARE Carga CURSOR  
        FOR SELECT	NoCuenta, Nombre, Chequera, Banco, Inicial, Final, Numero, Fecha, Importe
        FROM		PasoAnexo2IV1
        WHERE	IdFuncionario = @IdFuncionario
    
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo2IV1 WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @NoCuenta, @Nombre, @Chequera, @Banco, @Inicial, @Final, @Numero, @Fecha, @Importe
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        IF LTRIM(@Importe) = '' SET @Importe = '0'
        SET @Importe = REPLACE(@Importe,',','')
        SET @Importe = REPLACE(@Importe,'$','')
   
        IF LTRIM(@Chequera) = '' SET @Chequera = '0'
        SET @Chequera = REPLACE(@Chequera,',','')
        SET @Chequera = REPLACE(@Chequera,'$','')
        IF LTRIM(@Banco) = '' SET @Banco = '0'
        SET @Banco = REPLACE(@Banco,',','')
        SET @Banco = REPLACE(@Banco,'$','')
        IF ISNUMERIC(@Importe) = 1 AND ISNUMERIC(@Chequera) = 1 AND ISNUMERIC(@Banco) = 1
        BEGIN
            SET @nImporte = CAST(@Importe AS NUMERIC(22, 2))
            SET @Importe = substring(ltrim(CAST(@nImporte AS nvarchar(23))),1,20)
            SET @nChequera = CAST(@Chequera AS NUMERIC(22, 2))
            SET @Chequera = substring(ltrim(CAST(@nChequera AS nvarchar(23))),1,20)
            SET @nBanco = CAST(@Banco AS NUMERIC(22, 2))
            SET @Banco = substring(ltrim(CAST(@nBanco AS nvarchar(23))),1,20)
                INSERT INTO Anexo2IV1(IdFuncionario, NoCuenta, Nombre, Chequera, Banco, Inicial, Final, Numero, Fecha, Importe, UltimaCarga) 
                VALUES(@IdFuncionario, LTRIM(RTRIM(@NoCuenta)), LTRIM(RTRIM(@Nombre)), @Chequera, @Banco, LTRIM(RTRIM(@Inicial)), LTRIM(RTRIM(@Final)), LTRIM(RTRIM(@Numero)), LTRIM(RTRIM(@Fecha)), @Importe, 1 )
                IF (@@ERROR <> 0)
                BEGIN
                    SET @RegError = @RegError + 1
                    SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
                    INSERT INTO ErrAnexo2IV1(IdFuncionario, NoCuenta, Nombre, Chequera, Banco, Inicial, Final, Numero, Fecha, Importe, DescripcionError) 
                    VALUES(@IdFuncionario, @NoCuenta, @Nombre, @Chequera, @Banco, @Inicial, @Final, @Numero, @Fecha, @Importe, @DescripcionError)
                END
        END
        ELSE
             BEGIN
                  SET @RegError = @RegError + 1
                  INSERT INTO ErrAnexo2IV1(IdFuncionario, NoCuenta, Nombre, Chequera, Banco, Inicial, Final, Numero, Fecha, Importe, DescripcionError) 
                  VALUES(@IdFuncionario, @NoCuenta, @Nombre, @Chequera, @Banco, @Inicial, @Final, @Numero, @Fecha, @Importe, 'Saldo Según Chequera, Saldo Según Banco e Importe debe de ser Numérico') 
             END    
        FETCH NEXT FROM Carga INTO @NoCuenta, @Nombre, @Chequera, @Banco, @Inicial, @Final, @Numero, @Fecha, @Importe
    END
    DELETE PasoAnexo2IV1 WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE  PROCEDURE [CargaAnexo2IV2](@IdFuncionario  numeric)
AS 
    DECLARE 	@Fecha varchar(10),		@NoCuenta varchar(50),		@Banco varchar(100)
    DECLARE	@Beneficiario varchar(50), 	@NoCheque varchar(50), 	@Importe varchar(20)
    DECLARE	@DescripcionError varchar(255),	@RegACargar numeric(6),	@RegError numeric(6)
    DECLARE	@nImporte numeric(22,2)
    SET NOCOUNT ON 
    PRINT 'ANEXO2IV2'
    UPDATE ANEXO2IV2 SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario
    DECLARE Carga CURSOR  
        FOR SELECT	Fecha, NoCuenta, Banco, Beneficiario, NoCheque, Importe
        FROM		PasoAnexo2IV2
        WHERE	IdFuncionario = @IdFuncionario
    
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo2IV2 WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @Fecha, @NoCuenta, @Banco, @Beneficiario, @NoCheque, @Importe
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        IF LTRIM(@Importe) = '' SET @Importe = '0'
        SET @Importe = REPLACE(@Importe,',','')
        SET @Importe = REPLACE(@Importe,'$','')
        IF ISNUMERIC(@Importe) = 1
        BEGIN
            SET @nImporte = CAST(@Importe AS NUMERIC(22, 2))
            SET @Importe = substring(ltrim(CAST(@nImporte AS nvarchar(23))),1,20)
                INSERT INTO Anexo2IV2(IdFuncionario, Fecha, NoCuenta, Banco, Beneficiario, NoCheque, Importe, UltimaCarga) 
                VALUES(@IdFuncionario, LTRIM(RTRIM(@Fecha)), LTRIM(RTRIM(@NoCuenta)), LTRIM(RTRIM(@Banco)), LTRIM(RTRIM(@Beneficiario)), LTRIM(RTRIM(@NoCheque)), @Importe, 1 )
                IF (@@ERROR <> 0)
                BEGIN
                    SET @RegError = @RegError + 1
                    SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
                    INSERT INTO ErrAnexo2IV2(IdFuncionario, Fecha, NoCuenta, Banco, Beneficiario, NoCheque, Importe, DescripcionError)
                    VALUES(@IdFuncionario, @Fecha, @NoCuenta, @Banco, @Beneficiario, @NoCheque, @Importe, @DescripcionError)
                END
        END
        ELSE
             BEGIN
                  SET @RegError = @RegError + 1
                  INSERT INTO ErrAnexo2IV2(IdFuncionario, Fecha, NoCuenta, Banco, Beneficiario, NoCheque, Importe, DescripcionError) 
                  VALUES(@IdFuncionario, @Fecha, @NoCuenta, @Banco, @Beneficiario, @NoCheque, @Importe, 'Importe debe de ser Numérico') 
             END    
        FETCH NEXT FROM Carga INTO @Fecha, @NoCuenta, @Banco, @Beneficiario, @NoCheque, @Importe
    END
    DELETE PasoAnexo2IV2 WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE  PROCEDURE [CargaAnexo2IV3](@IdFuncionario  numeric)
AS 
    DECLARE 	@Fecha varchar(10),		@NoCuenta varchar(50),		@Institucion varchar(100)
    DECLARE	@Inversion varchar(50), 		@Vencimiento varchar(10), 	@Saldo varchar(20)
    DECLARE	@DescripcionError varchar(255),	@RegACargar numeric(6),	@RegError numeric(6)
    DECLARE	@nSaldo numeric(22,2)
    SET NOCOUNT ON 
    PRINT 'ANEXO2IV3'
    UPDATE ANEXO2IV3 SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario
    DECLARE Carga CURSOR  
        FOR SELECT	Fecha, NoCuenta, NombreInstitucion, TipoInversion, Vencimiento, Saldo
        FROM		PasoAnexo2IV3
        WHERE	IdFuncionario = @IdFuncionario
    
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo2IV3 WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @Fecha, @NoCuenta, @Institucion, @Inversion, @Vencimiento, @Saldo
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        IF LTRIM(@Saldo) = '' SET @Saldo = '0'
        SET @Saldo = REPLACE(@Saldo,',','')
        SET @SAldo = REPLACE(@Saldo,'$','')
        IF ISNUMERIC(@Saldo) = 1
        BEGIN
            SET @nSaldo = CAST(@Saldo AS NUMERIC(22, 2))
            SET @Saldo = substring(ltrim(CAST(@nSaldo AS nvarchar(23))),1,20)
                INSERT INTO Anexo2IV3(IdFuncionario, Fecha, NoCuenta, NombreInstitucion, TipoInversion, Vencimiento, Saldo, UltimaCarga) 
                VALUES(@IdFuncionario, LTRIM(RTRIM(@Fecha)), LTRIM(RTRIM(@NoCuenta)), LTRIM(RTRIM(@Institucion)), LTRIM(RTRIM(@Inversion)), LTRIM(RTRIM(@Vencimiento)), @Saldo, 1 )
                IF (@@ERROR <> 0)
                BEGIN
                    SET @RegError = @RegError + 1
                    SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
                    INSERT INTO ErrAnexo2IV3(IdFuncionario, Fecha, NoCuenta, NombreInstitucion, TipoInversion, Vencimiento, Saldo, DescripcionError)
                    VALUES(@IdFuncionario, @Fecha, @NoCuenta, @Institucion, @Inversion, @Vencimiento, @Saldo, @DescripcionError)
                END
        END
        ELSE
             BEGIN
                  SET @RegError = @RegError + 1
                  INSERT INTO ErrAnexo2IV3(IdFuncionario, Fecha, NoCuenta, NombreInstitucion, TipoInversion, Vencimiento, Saldo, DescripcionError) 
                  VALUES(@IdFuncionario, @Fecha, @NoCuenta, @Institucion, @Inversion, @Vencimiento, @Saldo, 'Saldo debe de ser Numérico') 
             END    
        FETCH NEXT FROM Carga INTO @Fecha, @NoCuenta, @Institucion, @Inversion, @Vencimiento, @Saldo
    END
    DELETE PasoAnexo2IV3 WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE  PROCEDURE [CargaAnexo2V](@IdFuncionario  numeric)
AS 
    DECLARE 	@NumeroDocumento varchar(50),	@NombreDeudor varchar(100),	@Concepto varchar(255)
    DECLARE	@FechaVencimiento varchar(10), 	@Importe varchar(20), 	@Saldo varchar(20),   @DescripcionError varchar(255)
    DECLARE 	@RegACargar numeric(6),		@RegError numeric(6)
    DECLARE	@nImporte numeric(22,2),		@nSaldo numeric(22,2)
    SET NOCOUNT ON 
    PRINT 'ANEXO2V'
    UPDATE ANEXO2V SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario
    DECLARE Carga CURSOR  
        FOR SELECT	NumeroDocumento, NombreDeudor, Concepto, FechaVencimiento, Importe,Saldo
        FROM		PasoAnexo2V
        WHERE	IdFuncionario = @IdFuncionario
    
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo2V WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @NumeroDocumento, @NombreDeudor, @Concepto, @FechaVencimiento, @Importe,@Saldo
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        IF LTRIM(@Importe) = '' SET @Importe = '0'
        SET @Importe = REPLACE(@Importe,',','')
        SET @Importe = REPLACE(@Importe,'$','')
        
        IF LTRIM(@Saldo) = '' SET @Saldo = '0'
        SET @Saldo = REPLACE(@Saldo,',','')
        SET @Saldo = REPLACE(@Saldo,'$','')
        IF ISNUMERIC(@Saldo) = 1  AND ISNUMERIC(@Importe) = 1
        BEGIN
            SET @nImporte = CAST(@Importe AS NUMERIC(22, 2))
            SET @Importe = substring(ltrim(CAST(@nImporte AS nvarchar(23))),1,20)
            SET @nSaldo = CAST(@Saldo AS NUMERIC(22, 2))
            SET @Saldo = substring(ltrim(CAST(@nSaldo AS nvarchar(23))),1,20)
            
       	 INSERT INTO Anexo2V(IdFuncionario, NumeroDocumento, NombreDeudor, Concepto, FechaVencimiento, Importe, Saldo, UltimaCarga) 
       	 VALUES(@IdFuncionario, LTRIM(RTRIM(@NumeroDocumento)), LTRIM(RTRIM(@NombreDeudor)), LTRIM(RTRIM(@Concepto)), LTRIM(RTRIM(@FechaVencimiento)), LTRIM(RTRIM(@Importe)) , LTRIM(RTRIM(@Saldo)), 1)
       	 IF (@@ERROR <> 0)
       	 BEGIN
           		 SET @RegError = @RegError + 1
           		 SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
         		   INSERT INTO ErrAnexo2V(IdFuncionario, NumeroDocumento, NombreDeudor, Concepto, FechaVencimiento, Importe,Saldo, DescripcionError) 
           		 VALUES(@IdFuncionario, @NumeroDocumento, @NombreDeudor, @Concepto, @FechaVencimiento, @Importe,@Saldo, @DescripcionError)
       	 END
       END
       ELSE
       BEGIN
            SET @RegError = @RegError + 1
             INSERT INTO ErrAnexo2V(IdFuncionario, NumeroDocumento, NombreDeudor, Concepto, FechaVencimiento, Importe,Saldo, DescripcionError) 
           	VALUES(@IdFuncionario, @NumeroDocumento, @NombreDeudor, @Concepto, @FechaVencimiento, @Importe,@Saldo, 'Importe y Saldo deben de ser Numéricos')
        END
        FETCH NEXT FROM Carga INTO @NumeroDocumento, @NombreDeudor, @Concepto, @FechaVencimiento, @Importe,@Saldo
    END
    DELETE PasoAnexo2V WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE  PROCEDURE [CargaAnexo2VI](@IdFuncionario  numeric)
AS 
    DECLARE 	@NumeroDocumento varchar(50),	@NombreAcreedor varchar(100),	@Concepto varchar(255)
    DECLARE	@FechaVencimiento varchar(10), 	@Importe varchar(20), 	@Saldo varchar(20),   @DescripcionError varchar(255)
    DECLARE 	@RegACargar numeric(6),		@RegError numeric(6)
    DECLARE	@nImporte numeric(22,2),		@nSaldo numeric(22,2)
    SET NOCOUNT ON 
    PRINT 'ANEXO2VI'
    UPDATE ANEXO2VI SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario
    DECLARE Carga CURSOR  
        FOR SELECT	NumeroDocumento, NombreAcreedor, Concepto, FechaVencimiento, Importe,Saldo
        FROM		PasoAnexo2VI
        WHERE	IdFuncionario = @IdFuncionario
    
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo2VI WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @NumeroDocumento, @NombreAcreedor, @Concepto, @FechaVencimiento, @Importe,@Saldo
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        IF LTRIM(@Importe) = '' SET @Importe = '0'
        SET @Importe = REPLACE(@Importe,',','')
        SET @Importe = REPLACE(@Importe,'$','')
        
        IF LTRIM(@Saldo) = '' SET @Saldo = '0'
        SET @Saldo = REPLACE(@Saldo,',','')
        SET @Saldo = REPLACE(@Saldo,'$','')
        IF ISNUMERIC(@Saldo) = 1  AND ISNUMERIC(@Importe) = 1
        BEGIN
            SET @nImporte = CAST(@Importe AS NUMERIC(22, 2))
            SET @Importe = substring(ltrim(CAST(@nImporte AS nvarchar(23))),1,20)
            SET @nSaldo = CAST(@Saldo AS NUMERIC(22, 2))
            SET @Saldo = substring(ltrim(CAST(@nSaldo AS nvarchar(23))),1,20)
            
       	 INSERT INTO Anexo2VI(IdFuncionario, NumeroDocumento, NombreAcreedor, Concepto, FechaVencimiento, Importe, Saldo, UltimaCarga) 
       	 VALUES(@IdFuncionario, LTRIM(RTRIM(@NumeroDocumento)), LTRIM(RTRIM(@NombreAcreedor)), LTRIM(RTRIM(@Concepto)), LTRIM(RTRIM(@FechaVencimiento)), LTRIM(RTRIM(@Importe)) , LTRIM(RTRIM(@Saldo)), 1)
       	 IF (@@ERROR <> 0)
       	 BEGIN
           		 SET @RegError = @RegError + 1
           		 SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
         		   INSERT INTO ErrAnexo2VI(IdFuncionario, NumeroDocumento, NombreAcreedor, Concepto, FechaVencimiento, Importe,Saldo, DescripcionError) 
           		 VALUES(@IdFuncionario, @NumeroDocumento, @NombreAcreedor, @Concepto, @FechaVencimiento, @Importe,@Saldo, @DescripcionError)
       	 END
       END
       ELSE
       BEGIN
            SET @RegError = @RegError + 1
             INSERT INTO ErrAnexo2VI(IdFuncionario, NumeroDocumento, NombreAcreedor, Concepto, FechaVencimiento, Importe,Saldo, DescripcionError) 
           	VALUES(@IdFuncionario, @NumeroDocumento, @NombreAcreedor, @Concepto, @FechaVencimiento, @Importe,@Saldo, 'Importe  debe de ser Numérico')
        END
        FETCH NEXT FROM Carga INTO @NumeroDocumento, @NombreAcreedor, @Concepto, @FechaVencimiento, @Importe,@Saldo
    END
    DELETE PasoAnexo2VI WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE  PROCEDURE [CargaAnexo3IV1](@IdFuncionario  numeric)
AS 
    DECLARE	@Nombre varchar(50), 		@Puesto varchar(100), 			@Categoria varchar(50)
    DECLARE	@Adscripcion varchar(50), 	@TipoPlaza varchar(1),			@SueldoBase varchar(20)
    DECLARE	@Compensacion varchar(20),	@OtrasPrestaciones varchar(20),		@Observacion varchar(255)
    DECLARE	@nSueldoBase numeric(22,2),	@nCompensacion numeric(22, 2),	@nOtrasPrestaciones numeric(22, 2)
    DECLARE	@Total NUMERIC(23,2),	 	@DescripcionError nvarchar(255), 	@TotalNV nvarchar(24) 
    
    DECLARE 	@RegACargar numeric(6),	@RegError numeric(6)
    UPDATE ANEXO3IV1 SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario
    SET NOCOUNT ON
    PRINT 'ANEXO3IV1'
    DECLARE Carga CURSOR
    FOR SELECT	Nombre, Puesto, Categoria, Adscripcion, TipoPlaza, SueldoBase, Compensacion, OtrasPrestaciones, Observacion
        FROM	PasoAnexo3IV1
        WHERE	IdFuncionario = @IdFuncionario
	
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo3IV1 WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @Nombre, @Puesto, @Categoria, @Adscripcion, @TipoPlaza, @SueldoBase, @Compensacion, @OtrasPrestaciones, @Observacion
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        IF LTRIM(@SueldoBase) = '' SET @SueldoBase = '0'
        IF LTRIM(@Compensacion) = '' SET @Compensacion = '0'
        IF LTRIM(@OtrasPrestaciones) = '' SET @OtrasPrestaciones = '0'
        SET @SueldoBase = REPLACE(@SueldoBase,',','')
        SET @SueldoBase = REPLACE(@SueldoBase,'$','')
        SET @Compensacion = REPLACE(@Compensacion,',','')
        SET @Compensacion = REPLACE(@Compensacion,'$','')
        SET @OtrasPrestaciones = REPLACE(@OtrasPrestaciones,',','')
        SET @OtrasPrestaciones = REPLACE(@OtrasPrestaciones,'$','')
        IF ISNUMERIC(@SueldoBase) = 1 AND ISNUMERIC(@Compensacion) = 1 AND ISNUMERIC(@OtrasPrestaciones) = 1
        BEGIN
            SET @nSueldoBase = CAST(@SueldoBase AS NUMERIC(22, 2))
            SET @nCompensacion = CAST(@Compensacion AS NUMERIC(22,2))
            SET @nOtrasPrestaciones = CAST(@OtrasPrestaciones AS NUMERIC(22,2))
            
            SET @Total = @nSueldoBase + @nCompensacion + @nOtrasPrestaciones
            PRINT @Total
            SET @TotalNV = substring(ltrim(CAST(@Total AS nvarchar(24))),1,20)
            SET @SueldoBase = substring(ltrim(CAST(@nSueldoBase AS nvarchar(23))),1,20)
            SET @Compensacion = substring(ltrim(CAST(@nCompensacion AS nvarchar(23))),1,20)
            SET @OtrasPrestaciones = substring(ltrim(CAST(@nOtrasPrestaciones AS nvarchar(23))),1,20)
            PRINT @TotalNV
            IF @TipoPlaza = '1' OR @TipoPlaza = '2' OR @TipoPlaza = '3'
            BEGIN
                INSERT INTO Anexo3IV1(IdFuncionario, Nombre, Puesto, Categoria, Adscripcion, TipoPlaza, SueldoBase, Compensacion, OtrasPrestaciones, Total, Observaciones, UltimaCarga) 
                VALUES(@IdFuncionario, LTRIM(RTRIM(@Nombre)), LTRIM(RTRIM(@Puesto)), LTRIM(RTRIM(@Categoria)), LTRIM(RTRIM(@Adscripcion)), @TipoPlaza, @SueldoBase, @Compensacion, @OtrasPrestaciones, @TotalNV, LTRIM(RTRIM(@Observacion)), 1)
                IF (@@ERROR <> 0)
                BEGIN
                    SET @RegError = @RegError + 1
                    SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
                    
                    INSERT INTO ErrAnexo3IV1(IdFuncionario, Nombre, Puesto, Categoria, Adscripcion, TipoPlaza, SueldoBase, Compensacion, OtrasPrestaciones, Observacion, DescripcionError)
                    VALUES(@IdFuncionario, @Nombre, @Puesto, @Categoria, @Adscripcion, @TipoPlaza, @SueldoBase, @Compensacion, @OtrasPrestaciones, @Observacion, @DescripcionError)
                END
            END 
            ELSE
            BEGIN
                SET @RegError = @RegError + 1
                INSERT INTO ErrAnexo3IV1(IdFuncionario, Nombre, Puesto, Categoria, Adscripcion, TipoPlaza, SueldoBase, Compensacion, OtrasPrestaciones, Observacion, DescripcionError) 
                VALUES(@IdFuncionario, @Nombre, @Puesto, @Categoria, @Adscripcion, @TipoPlaza, @SueldoBase, @Compensacion, @OtrasPrestaciones, @Observacion, 'Tipo de Plaza debe ser 1, 2 o 3')
            END
        END 
        ELSE
        BEGIN
            SET @RegError = @RegError + 1
            INSERT INTO ErrAnexo3IV1(IdFuncionario, Nombre, Puesto, Categoria, Adscripcion, TipoPlaza, SueldoBase, Compensacion, OtrasPrestaciones, Observacion, DescripcionError) 
            VALUES(@IdFuncionario, @Nombre, @Puesto, @Categoria, @Adscripcion, @TipoPlaza, @SueldoBase, @Compensacion, @OtrasPrestaciones, @Observacion, 'SueldoBase, Compensacion y OtrasPrestaciones Deben ser númerico')
        END
        FETCH NEXT FROM Carga INTO @Nombre, @Puesto, @Categoria, @Adscripcion, @TipoPlaza, @SueldoBase, @Compensacion, @OtrasPrestaciones, @Observacion
    END
	
    DELETE PasoAnexo3IV1 WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE   PROCEDURE [CargaAnexo3IV1RH](@Usuario nvarchar(10))
AS 
    DECLARE @Nombre varchar(50),        @Puesto varchar(100),           @Categoria varchar(50)
    DECLARE @Adscripcion varchar(50),   @TipoPlaza char(1),             @SueldoBase varchar(20)
    DECLARE @Compensacion varchar(20),  @OtrasPrestaciones varchar(20),	@Observacion varchar(255)
    DECLARE @nSueldoBase numeric(22,2), @nCompensacion numeric(22, 2),	@nOtrasPrestaciones numeric(22, 2)
    DECLARE @ClaveTipoNomina varchar(2),@IdUnidadAdministrativa varchar(5) 
    DECLARE @DescripcionError varchar(255), @bFlag bit, @iIdFuncionario varchar(6)
    DECLARE @Total NUMERIC(23,2),       @TotalNV nvarchar(24) 
    DECLARE @IdFuncionarios varchar(5000), @IdFuncionarioANT varchar(6),@Sep varchar(3)
    DECLARE @RegACargar numeric(6),	@RegError numeric(6)

    SET NOCOUNT ON
    --PRINT 'ANEXO3IV1RH'
    DECLARE Carga CURSOR
    FOR SELECT Nombre, Puesto, Categoria, Adscripcion, Ltrim(RTrim(TipoPlaza)), SueldoBase, Compensacion, OtrasPrestaciones, Observacion, Ltrim(RTrim(ClaveTipoNomina)), Ltrim(RTrim(IdUnidadAdministrativa))
        FROM   PasoAnexo3IV1RH
        WHERE  UsuarioRH = @Usuario
        ORDER BY IdUnidadAdministrativa
	
    SET @RegACargar = 0
    SET @RegError = 0
    SET @IdFuncionarioANT = ''
    SET @IdFuncionarios = ''
    SET @Sep = ''

    DELETE ErrAnexo3IV1RH WHERE UsuarioRH = @Usuario
    DELETE ResumenAnexo3IV1RH WHERE UsuarioRH = @Usuario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @Nombre, @Puesto, @Categoria, @Adscripcion, @TipoPlaza, @SueldoBase, @Compensacion, @OtrasPrestaciones, @Observacion, @ClaveTipoNomina, @IdUnidadAdministrativa
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @bFlag = 0
        SET @DescripcionError = ''
        SET @iIdFuncionario = 0
	IF ISNUMERIC(@IdUnidadAdministrativa) <> 1
            SET @IdUnidadAdministrativa = '-1'

        SET @RegACargar = @RegACargar + 1
        IF LTRIM(@SueldoBase) = '' SET @SueldoBase = '0'
        IF LTRIM(@Compensacion) = '' SET @Compensacion = '0'
        IF LTRIM(@OtrasPrestaciones) = '' SET @OtrasPrestaciones = '0'
	IF @IdUnidadAdministrativa IS NULL OR LTRIM(@IdUnidadAdministrativa) = '' SET @IdUnidadAdministrativa = '0'

        SET @SueldoBase = REPLACE(@SueldoBase,',','')
        SET @SueldoBase = REPLACE(@SueldoBase,'$','')
        SET @Compensacion = REPLACE(@Compensacion,',','')
        SET @Compensacion = REPLACE(@Compensacion,'$','')
        SET @OtrasPrestaciones = REPLACE(@OtrasPrestaciones,',','')
        SET @OtrasPrestaciones = REPLACE(@OtrasPrestaciones,'$','')
        IF ISNUMERIC(@SueldoBase) <> 1 OR ISNUMERIC(@Compensacion) <> 1 OR ISNUMERIC(@OtrasPrestaciones) <> 1
        BEGIN
            SET @DescripcionError = 'SueldoBase, Compensacion y OtrasPrestaciones Deben ser númerico'
            SET @bFlag = 1
        END

        IF @bFlag = 0 AND (@TipoPlaza <> '1' AND @TipoPlaza <> '2' AND @TipoPlaza <> '3')
        BEGIN
            SET @DescripcionError = 'Tipo de Plaza debe ser 1, 2 o 3'
            SET @bFlag = 1
        END

        IF @bFlag = 0 AND (@ClaveTipoNomina NOT IN (Select Clave From TipoNomina))
        BEGIN
            SET @DescripcionError = 'El Tipo de Nomina no existe'
            SET @bFlag = 1
        END
        ELSE
        BEGIN
            SET @ClaveTipoNomina = (Select Clave From TipoNomina WHERE LTRIM(RTRIM(Clave)) = LTRIM(RTRIM(@ClaveTipoNomina)) )
        END

        DECLARE @iIdUnidadGobierno nvarchar(6)
	SET @iIdUnidadGobierno = 0

	PRINT @IdUnidadAdministrativa
	Select @iIdFuncionario = IdFuncionario From Cargo A 
        Where A.IdUnidadAdministrativa = CAST(@IdUnidadAdministrativa AS NUMERIC(6,0))
        
        IF @bFlag = 0 AND @@RowCount = 0
        BEGIN
            SET @DescripcionError = 'No existe la Unidad Administrativa'
            SET @bFlag = 1
            
        END
        ELSE
            Select @iIdUnidadGobierno = IdUnidadGobierno From UnidadAdministrativa A 
            Where A.IdUnidadAdministrativa = @IdUnidadAdministrativa 
	
        PRINT @bFlag

        IF @bFlag = 0 
        BEGIN
            Select @iIdFuncionario = IdFuncionario From Cargo A 
            Where A.IdUnidadAdministrativa = @IdUnidadAdministrativa

            SET @nSueldoBase = CAST(@SueldoBase AS NUMERIC(22, 2))
            SET @nCompensacion = CAST(@Compensacion AS NUMERIC(22,2))
            SET @nOtrasPrestaciones = CAST(@OtrasPrestaciones AS NUMERIC(22,2))
            
            SET @Total = @nSueldoBase + @nCompensacion + @nOtrasPrestaciones
            --PRINT @Total
            SET @TotalNV = substring(ltrim(CAST(@Total AS nvarchar(24))),1,20)
            SET @SueldoBase = substring(ltrim(CAST(@nSueldoBase AS nvarchar(23))),1,20)
            SET @Compensacion = substring(ltrim(CAST(@nCompensacion AS nvarchar(23))),1,20)
            SET @OtrasPrestaciones = substring(ltrim(CAST(@nOtrasPrestaciones AS nvarchar(23))),1,20)
            --PRINT @TotalNV
             
            INSERT INTO Anexo3IV1(IdFuncionario, Nombre, Puesto, Categoria, Adscripcion, TipoPlaza, SueldoBase, Compensacion, OtrasPrestaciones, Total, Observaciones, ClaveTipoNomina, UltimaCarga) 
            VALUES(@iIdFuncionario, LTRIM(RTRIM(@Nombre)), LTRIM(RTRIM(@Puesto)), LTRIM(RTRIM(@Categoria)), LTRIM(RTRIM(@Adscripcion)), @TipoPlaza, @SueldoBase, @Compensacion, @OtrasPrestaciones, @TotalNV, LTRIM(RTRIM(@Observacion)), @ClaveTipoNomina, 0)

            IF (@@ERROR <> 0)
            BEGIN
                SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
                SET @bFlag = 1
            END
        END

        IF @bFlag = 1 
        BEGIN
            SET @RegError = @RegError + 1
            --PRINT  @DescripcionError
            --PRINT  @RegError
            INSERT INTO ErrAnexo3IV1RH(UsuarioRH, Nombre, Puesto, Categoria, Adscripcion, TipoPlaza, SueldoBase, Compensacion, OtrasPrestaciones, Observacion, ClaveTipoNomina, IdUnidadAdministrativa, DescripcionError)
            VALUES(@Usuario, @Nombre, @Puesto, @Categoria, @Adscripcion, @TipoPlaza, @SueldoBase, @Compensacion, @OtrasPrestaciones, @Observacion, @ClaveTipoNomina, @IdUnidadAdministrativa, @DescripcionError)
        END
        ELSE
        BEGIN
            IF @IdFuncionarioANT <> @iIdFuncionario
            BEGIN
                SET @IdFuncionarioANT = @iIdFuncionario
                SET @IdFuncionarios = @IdFuncionarios + @Sep + @iIdFuncionario 
                SET @Sep = ', '
            END
        END


	DECLARE @RegACargaRes numeric(6), @RegErrorRes numeric(6)

	SELECT @RegACargaRes = IsNull(RegACargar, 0), @RegErrorRes = RegError
	FROM ResumenAnexo3IV1RH
	WHERE UsuarioRH = @Usuario 
	AND IdUnidadGobierno = @iIdUnidadGobierno
	AND IdUnidadAdministrativa = @IdUnidadAdministrativa
        IF @@RowCount = 0
	    INSERT INTO ResumenAnexo3IV1RH(UsuarioRH, IdUnidadGobierno, IdUnidadAdministrativa, RegACargar, RegError)
	    VALUES(@Usuario, @iIdUnidadGobierno, @IdUnidadAdministrativa, 1, @bFlag)
	ELSE
	    UPDATE ResumenAnexo3IV1RH SET RegACargar = RegACargar + 1, RegError = RegError + @bFlag
	    WHERE UsuarioRH = @Usuario 
            AND IdUnidadGobierno = @iIdUnidadGobierno
            AND IdUnidadAdministrativa = @IdUnidadAdministrativa

       
        FETCH NEXT FROM Carga INTO @Nombre, @Puesto, @Categoria, @Adscripcion, @TipoPlaza, @SueldoBase, @Compensacion, @OtrasPrestaciones, @Observacion, @ClaveTipoNomina, @IdUnidadAdministrativa

    END
	
    DELETE PasoAnexo3IV1RH WHERE UsuarioRH = @Usuario
    --PRINT 'FUNS:' + @IdFuncionarios

    IF @IdFuncionarios <> ''
    BEGIN
        DECLARE @strSQL varchar(6000)
        SET @strSQL = 'UPDATE AnexoEstatus SET Observacion = ''' + right('0' + ltrim(cast(DATEPART(dd, GETDATE()) as varchar)), 2) +
            '/' + right('0' + ltrim(cast(DATEPART(mm, GETDATE()) as varchar)), 2) + 
            '/' + ltrim(cast(DATEPART(yyyy, GETDATE())  as varchar)) + ' ' +
            right('0' + ltrim(cast(DATEPART(hh, GETDATE()) as varchar)), 2) +
            ':' + right('0' + ltrim(cast(DATEPART(mi, GETDATE()) as varchar)), 2) + 
            ':' + right('0' + ltrim(cast(DATEPART(ss, GETDATE()) as varchar)), 2) + 
	    ''' WHERE IdFuncionario in (' + @IdFuncionarios + ') AND IdAnexo = 17'
        PRINT @strSQL
        EXEC(@strSQL)
    END

    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF

    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE  PROCEDURE [CargaAnexo3IV2](@IdFuncionario  numeric)
AS 
    DECLARE	@Nomina varchar(20), 		@Nombre varchar(50), 			@Situacion varchar(1)
    DECLARE	@ComisionadoDE varchar(50), 	@ComisionadoA varchar(50),		@PeriodoDE varchar(10)
    DECLARE	@PeriodoA varchar(10),		@Observacion varchar(255),		@DescripcionError varchar(255)
    DECLARE 	@RegACargar numeric(6),	@RegError numeric(6)
    SET NOCOUNT ON
    PRINT 'ANEXO3IV2'
    UPDATE ANEXO3IV2 SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario
    DECLARE Carga CURSOR
    FOR SELECT	Nomina, Nombre, Situacion, ComisionadoDE, ComisionadoA, PeriodoDE, PeriodoA, Observacion
        FROM	PasoAnexo3IV2
        WHERE	IdFuncionario = @IdFuncionario
	
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo3IV2 WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @Nomina, @Nombre, @Situacion, @ComisionadoDE, @ComisionadoA, @PeriodoDE, @PeriodoA, @Observacion
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        IF @Situacion = 'L' OR @Situacion = 'P' OR @Situacion = 'C'
        BEGIN
            INSERT INTO Anexo3IV2(IdFuncionario, Nomina, Nombre, Situacion, DeComisionado, AComisionado, FechaDePeriodo, FechaAPeriodo, Observaciones, UltimaCarga) 
            VALUES(@IdFuncionario, LTRIM(RTRIM(@Nomina)), LTRIM(RTRIM(@Nombre)), LTRIM(RTRIM(@Situacion)), LTRIM(RTRIM(@ComisionadoDE)), LTRIM(RTRIM(@ComisionadoA)), LTRIM(RTRIM(@PeriodoDE)), LTRIM(RTRIM(@PeriodoA)), LTRIM(RTRIM(@Observacion)), 1)
            IF (@@ERROR <> 0)
            BEGIN
                SET @RegError = @RegError + 1
                SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR		
                INSERT INTO ErrAnexo3IV2(IdFuncionario, Nomina, Nombre, Situacion, ComisionadoDE, ComisionadoA, PeriodoDE, PeriodoA, Observacion, DescripcionError) 
                VALUES(@IdFuncionario, @Nomina, @Nombre, @Situacion, @ComisionadoDE, @ComisionadoA, @PeriodoDE, @PeriodoA, @Observacion, @DescripcionError)
            END
        END
        ELSE
        BEGIN
            SET @RegError = @RegError + 1
            INSERT INTO ErrAnexo3IV2(IdFuncionario, Nomina, Nombre, Situacion, ComisionadoDE, ComisionadoA, PeriodoDE, PeriodoA, Observacion, DescripcionError) 
            VALUES(@IdFuncionario, @Nomina, @Nombre, @Situacion, @ComisionadoDE, @ComisionadoA, @PeriodoDE, @PeriodoA, @Observacion, 'Tipo debe de ser : L=Licencia, P=Permiso, C=Construcción')
        END
        FETCH NEXT FROM Carga INTO @Nomina, @Nombre, @Situacion, @ComisionadoDE, @ComisionadoA, @PeriodoDE, @PeriodoA, @Observacion
    END
    DELETE PasoAnexo3IV2 WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE    PROCEDURE [CargaAnexo3IV2RH](@Usuario nvarchar(10))
AS 
    DECLARE @Nomina varchar(20),            @Nombre varchar(50),       @Situacion char(1)
    DECLARE @ComisionadoDE varchar(50),     @ComisionadoA varchar(50), @PeriodoDE varchar(10)
    DECLARE @PeriodoA varchar(10),          @Observacion varchar(255)
    DECLARE @ClaveTipoNomina varchar(2),    @IdUnidadAdministrativa varchar(5) 
    DECLARE @DescripcionError varchar(255), @bFlag bit,                @iIdFuncionario varchar(6)
    DECLARE @IdFuncionarios varchar(5000),  @IdFuncionarioANT varchar(6),@Sep varchar(3)
    DECLARE @RegACargar numeric(6),         @RegError numeric(6)

    SET NOCOUNT ON
    --PRINT 'ANEXO3IV2'
    DECLARE Carga CURSOR
    FOR SELECT Nomina, Nombre, LTRIM(RTRIM(Situacion)), ComisionadoDE, ComisionadoA, PeriodoDE, PeriodoA, Observacion, Ltrim(RTrim(ClaveTipoNomina)), Ltrim(RTrim(IdUnidadAdministrativa))
        FROM   PasoAnexo3IV2RH
        WHERE  UsuarioRH = @Usuario
	ORDER BY IdUnidadAdministrativa

    SET @RegACargar = 0
    SET @RegError = 0
    SET @IdFuncionarioANT = ''
    SET @IdFuncionarios = ''
    SET @Sep = ''
    
    DELETE ErrAnexo3IV2RH WHERE UsuarioRH = @Usuario
    DELETE ResumenAnexo3IV2RH WHERE UsuarioRH = @Usuario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @Nomina, @Nombre, @Situacion, @ComisionadoDE, @ComisionadoA, @PeriodoDE, @PeriodoA, @Observacion, @ClaveTipoNomina, @IdUnidadAdministrativa
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @bFlag = 0
        SET @DescripcionError = ''
        SET @iIdFuncionario = 0
	IF @IdUnidadAdministrativa IS NULL OR LTRIM(@IdUnidadAdministrativa) = '' SET @IdUnidadAdministrativa = '0'
	IF ISNUMERIC(@IdUnidadAdministrativa) <> 1
            SET @IdUnidadAdministrativa = '-1'

        SET @RegACargar = @RegACargar + 1

        IF @bFlag = 0 AND (@Situacion <> 'L' AND @Situacion <> 'P' AND @Situacion <> 'C')
        BEGIN
            SET @DescripcionError = 'Tipo debe de ser : L=Licencia, P=Permiso, C=Construcción'
            SET @bFlag = 1
        END
        ELSE
        BEGIN
            SET @Situacion = UPPER(@Situacion)
        END

        --PRINT @ClaveTipoNomina
        IF @bFlag = 0 AND (LTRIM(RTRIM(@ClaveTipoNomina)) NOT IN (Select LTRIM(RTRIM(Clave)) From TipoNomina))
        BEGIN
            SET @DescripcionError = 'El Tipo de Nomina no existe'
            SET @bFlag = 1
        END
        ELSE
        BEGIN
            SET @ClaveTipoNomina = (Select Clave From TipoNomina WHERE LTRIM(RTRIM(Clave)) = LTRIM(RTRIM(@ClaveTipoNomina)) )
        END

        --PRINT @bFlag
        --PRINT @DescripcionError
        PRINT @ClaveTipoNomina
	--PRINT @IdUnidadAdministrativa
	
        DECLARE @iIdUnidadGobierno nvarchar(6)
	SET @iIdUnidadGobierno = 0

	PRINT @IdUnidadAdministrativa
	Select @iIdFuncionario = IdFuncionario From Cargo A 
        Where A.IdUnidadAdministrativa = CAST(@IdUnidadAdministrativa AS NUMERIC(6,0))
        
        IF @bFlag = 0 AND @@RowCount = 0
        BEGIN
            SET @DescripcionError = 'No existe la Unidad Administrativa'
            SET @bFlag = 1
        END
	ELSE
            Select @iIdUnidadGobierno = IdUnidadGobierno From UnidadAdministrativa A 
            Where A.IdUnidadAdministrativa = @IdUnidadAdministrativa
        
        IF @bFlag = 0 
        BEGIN
            INSERT INTO Anexo3IV2(IdFuncionario, Nomina, Nombre, Situacion, DeComisionado, AComisionado, FechaDePeriodo, FechaAPeriodo, Observaciones, ClaveTipoNomina, UltimaCarga) 
            VALUES(@iIdFuncionario, LTRIM(RTRIM(@Nomina)), LTRIM(RTRIM(@Nombre)), LTRIM(RTRIM(@Situacion)), LTRIM(RTRIM(@ComisionadoDE)), LTRIM(RTRIM(@ComisionadoA)), LTRIM(RTRIM(@PeriodoDE)), LTRIM(RTRIM(@PeriodoA)), LTRIM(RTRIM(@Observacion)), @ClaveTipoNomina, 0)
            IF (@@ERROR <> 0)
            BEGIN
                SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
                SET @bFlag = 1
            END
        END

        IF @bFlag = 1 
        BEGIN
            SET @RegError = @RegError + 1
            INSERT INTO ErrAnexo3IV2RH(UsuarioRH, Nomina, Nombre, Situacion, ComisionadoDE, ComisionadoA, PeriodoDE, PeriodoA, Observacion, ClaveTipoNomina, IdUnidadAdministrativa, DescripcionError)
            VALUES(@Usuario, @Nomina, @Nombre, @Situacion, @ComisionadoDE, @ComisionadoA, @PeriodoDE, @PeriodoA, @Observacion, @ClaveTipoNomina, @IdUnidadAdministrativa, @DescripcionError)
        END
        ELSE
        BEGIN
            IF @IdFuncionarioANT <> @iIdFuncionario
            BEGIN
                SET @IdFuncionarioANT = @iIdFuncionario
                SET @IdFuncionarios = @IdFuncionarios + @Sep + @iIdFuncionario 
                SET @Sep = ', '
            END
        END

	DECLARE @RegACargaRes numeric(6), @RegErrorRes numeric(6)

	SELECT @RegACargaRes = IsNull(RegACargar, 0), @RegErrorRes = RegError
	FROM ResumenAnexo3IV2RH
	WHERE UsuarioRH = @Usuario 
	AND IdUnidadGobierno = @iIdUnidadGobierno
	AND IdUnidadAdministrativa = @IdUnidadAdministrativa
        IF @@RowCount = 0
	    INSERT INTO ResumenAnexo3IV2RH(UsuarioRH, IdUnidadGobierno, IdUnidadAdministrativa, RegACargar, RegError)
	    VALUES(@Usuario, @iIdUnidadGobierno, @IdUnidadAdministrativa, 1, @bFlag)
	ELSE
	    UPDATE ResumenAnexo3IV2RH SET RegACargar = RegACargar + 1, RegError = RegError + @bFlag
	    WHERE UsuarioRH = @Usuario 
            AND IdUnidadGobierno = @iIdUnidadGobierno
            AND IdUnidadAdministrativa = @IdUnidadAdministrativa


        FETCH NEXT FROM Carga INTO @Nomina, @Nombre, @Situacion, @ComisionadoDE, @ComisionadoA, @PeriodoDE, @PeriodoA, @Observacion, @ClaveTipoNomina, @IdUnidadAdministrativa
    END
    DELETE PasoAnexo3IV2RH WHERE UsuarioRH = @Usuario

    IF @IdFuncionarios <> ''
    BEGIN
        DECLARE @strSQL varchar(6000)
        SET @strSQL = 'UPDATE AnexoEstatus SET Observacion = ''' + right('0' + ltrim(cast(DATEPART(dd, GETDATE()) as varchar)), 2) +
            '/' + right('0' + ltrim(cast(DATEPART(mm, GETDATE()) as varchar)), 2) + 
            '/' + ltrim(cast(DATEPART(yyyy, GETDATE())  as varchar)) + ' ' +
            right('0' + ltrim(cast(DATEPART(hh, GETDATE()) as varchar)), 2) +
            ':' + right('0' + ltrim(cast(DATEPART(mi, GETDATE()) as varchar)), 2) + 
            ':' + right('0' + ltrim(cast(DATEPART(ss, GETDATE()) as varchar)), 2) + 
	    ''' WHERE IdFuncionario in (' + @IdFuncionarios + ') AND IdAnexo = 18'
        PRINT @strSQL
        EXEC(@strSQL)
    END

    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE  PROCEDURE [CargaAnexo3IV5](@IdFuncionario  numeric)
AS 
    DECLARE @NoEmpleado varchar(20),	@Nombre varchar(50), @Puesto varchar(100), @UAdministrativa varchar(50), @DescripcionError varchar(255)
    DECLARE @RegACargar numeric(6),	@RegError numeric(6)
    SET NOCOUNT ON
    PRINT 'ANEXO3IV5'
    UPDATE ANEXO3IV5 SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario
    DECLARE Carga CURSOR  
    FOR SELECT		NoEmpleado, Nombre, Puesto, UAdministrativa
        FROM		PasoAnexo3IV5
        WHERE	IdFuncionario = @IdFuncionario
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo3IV5 WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @NoEmpleado, @Nombre, @Puesto, @UAdministrativa
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        INSERT INTO Anexo3IV5(IdFuncionario, Numero, Nombre, Puesto, UnidadAdministrativa, UltimaCarga) 
        VALUES(@IdFuncionario, LTRIM(RTRIM(@NoEmpleado)), LTRIM(RTRIM(@Nombre)), LTRIM(RTRIM(@Puesto)), LTRIM(RTRIM(@UAdministrativa)), 1)
        IF (@@ERROR <> 0)  
        BEGIN
            SET @RegError = @RegError + 1
            SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
            
            INSERT INTO ErrAnexo3IV5(IdFuncionario, NoEmpleado, Nombre, Puesto, UAdministrativa, DescripcionError) 
            VALUES(@IdFuncionario, @NoEmpleado, @Nombre, @Puesto, @UAdministrativa, @DescripcionError)		
        END		
        FETCH NEXT FROM Carga INTO @NoEmpleado, @Nombre, @Puesto, @UAdministrativa
    END
    DELETE PasoAnexo3IV5  WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE [CargaAnexo3IV5RH](@Usuario nvarchar(10))
AS 
    DECLARE @NoEmpleado varchar(20),        @Nombre varchar(50),  @Puesto varchar(100), @UAdministrativa varchar(50)
    DECLARE @ClaveTipoNomina varchar(2),    @IdUnidadAdministrativa varchar(5) 
    DECLARE @DescripcionError varchar(255), @bFlag bit,           @iIdFuncionario varchar(6)
    DECLARE @IdFuncionarios varchar(5000),  @IdFuncionarioANT varchar(6),@Sep varchar(3)
    DECLARE @RegACargar numeric(6),         @RegError numeric(6)

    SET NOCOUNT ON
    --PRINT 'ANEXO3IV5'

    DECLARE Carga CURSOR  
    FOR SELECT NoEmpleado, Nombre, Puesto, UAdministrativa, Ltrim(RTrim(ClaveTipoNomina)), Ltrim(RTrim(IdUnidadAdministrativa))
        FROM   PasoAnexo3IV5RH
        WHERE  UsuarioRH = @Usuario
        ORDER BY IdUnidadAdministrativa

    SET @RegACargar = 0
    SET @RegError = 0
    SET @IdFuncionarioANT = ''
    SET @IdFuncionarios = ''
    SET @Sep = ''

    DELETE ErrAnexo3IV5RH WHERE UsuarioRH = @Usuario
    DELETE ResumenAnexo3IV5RH WHERE UsuarioRH = @Usuario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @NoEmpleado, @Nombre, @Puesto, @UAdministrativa, @ClaveTipoNomina, @IdUnidadAdministrativa
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @bFlag = 0
        SET @DescripcionError = ''
        SET @RegACargar = @RegACargar + 1
        SET @iIdFuncionario = 0
	IF @IdUnidadAdministrativa IS NULL OR LTRIM(@IdUnidadAdministrativa) = '' SET @IdUnidadAdministrativa = '0'
	IF ISNUMERIC(@IdUnidadAdministrativa) <> 1
            SET @IdUnidadAdministrativa = '-1'

        IF @bFlag = 0 AND (@ClaveTipoNomina NOT IN (Select Clave From TipoNomina))
        BEGIN
            SET @DescripcionError = 'El Tipo de Nomina no existe'
            SET @bFlag = 1
        END
        ELSE
        BEGIN
            SET @ClaveTipoNomina = (Select Clave From TipoNomina WHERE LTRIM(RTRIM(Clave)) = LTRIM(RTRIM(@ClaveTipoNomina)) )
        END

	--PRINT @IdUnidadAdministrativa
	
        DECLARE @iIdUnidadGobierno nvarchar(6)
	SET @iIdUnidadGobierno = 0

	PRINT @IdUnidadAdministrativa
	Select @iIdFuncionario = IdFuncionario From Cargo A 
        Where A.IdUnidadAdministrativa = CAST(@IdUnidadAdministrativa AS NUMERIC(6,0))

        IF @bFlag = 0 AND @@RowCount = 0
        BEGIN
            SET @DescripcionError = 'No existe la Unidad Administrativa'
            SET @bFlag = 1
        END
	ELSE
            Select @iIdUnidadGobierno = IdUnidadGobierno From UnidadAdministrativa A 
            Where A.IdUnidadAdministrativa = @IdUnidadAdministrativa
        
        
        IF @bFlag = 0 
        BEGIN
            INSERT INTO Anexo3IV5(IdFuncionario, Numero, Nombre, Puesto, UnidadAdministrativa, ClaveTipoNomina, UltimaCarga) 
            VALUES(@iIdFuncionario, LTRIM(RTRIM(@NoEmpleado)), LTRIM(RTRIM(@Nombre)), LTRIM(RTRIM(@Puesto)), LTRIM(RTRIM(@UAdministrativa)), @ClaveTipoNomina, 0)
            IF (@@ERROR <> 0)
            BEGIN
		SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
		PRINT @DescripcionError
                SET @bFlag = 1
            END
        END

        IF @bFlag = 1 
        BEGIN
            SET @RegError = @RegError + 1
             
            INSERT INTO ErrAnexo3IV5RH(UsuarioRH, NoEmpleado, Nombre, Puesto, UAdministrativa, ClaveTipoNomina, IdUnidadAdministrativa, DescripcionError)
            VALUES(@Usuario, @NoEmpleado, @Nombre, @Puesto, @UAdministrativa, @ClaveTipoNomina, @IdUnidadAdministrativa, @DescripcionError)
        END
        ELSE
        BEGIN
            IF @IdFuncionarioANT <> @iIdFuncionario
            BEGIN
                SET @IdFuncionarioANT = @iIdFuncionario
                SET @IdFuncionarios = @IdFuncionarios + @Sep + @iIdFuncionario 
                SET @Sep = ', '
            END
        END
	
	DECLARE @RegACargaRes numeric(6), @RegErrorRes numeric(6)

	SELECT @RegACargaRes = IsNull(RegACargar, 0), @RegErrorRes = RegError
	FROM ResumenAnexo3IV5RH
	WHERE UsuarioRH = @Usuario 
	AND IdUnidadGobierno = @iIdUnidadGobierno
	AND IdUnidadAdministrativa = @IdUnidadAdministrativa
        IF @@RowCount = 0
	    INSERT INTO ResumenAnexo3IV5RH(UsuarioRH, IdUnidadGobierno, IdUnidadAdministrativa, RegACargar, RegError)
	    VALUES(@Usuario, @iIdUnidadGobierno, @IdUnidadAdministrativa, 1, @bFlag)
	ELSE
	    UPDATE ResumenAnexo3IV5RH SET RegACargar = RegACargar + 1, RegError = RegError + @bFlag
	    WHERE UsuarioRH = @Usuario 
            AND IdUnidadGobierno = @iIdUnidadGobierno
            AND IdUnidadAdministrativa = @IdUnidadAdministrativa

        FETCH NEXT FROM Carga INTO @NoEmpleado, @Nombre, @Puesto, @UAdministrativa, @ClaveTipoNomina, @IdUnidadAdministrativa
    END
    DELETE PasoAnexo3IV5RH  WHERE UsuarioRH = @Usuario

    IF @IdFuncionarios <> ''
    BEGIN
        DECLARE @strSQL varchar(6000)
        SET @strSQL = 'UPDATE AnexoEstatus SET Observacion = ''' + right('0' + ltrim(cast(DATEPART(dd, GETDATE()) as varchar)), 2) +
            '/' + right('0' + ltrim(cast(DATEPART(mm, GETDATE()) as varchar)), 2) + 
            '/' + ltrim(cast(DATEPART(yyyy, GETDATE())  as varchar)) + ' ' +
            right('0' + ltrim(cast(DATEPART(hh, GETDATE()) as varchar)), 2) +
            ':' + right('0' + ltrim(cast(DATEPART(mi, GETDATE()) as varchar)), 2) + 
            ':' + right('0' + ltrim(cast(DATEPART(ss, GETDATE()) as varchar)), 2) + 
	    ''' WHERE IdFuncionario in (' + @IdFuncionarios + ') AND IdAnexo = 21'
        PRINT @strSQL
        EXEC(@strSQL)
    END

    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE  PROCEDURE [CargaAnexo3IX](@IdFuncionario  numeric)
AS 
    DECLARE	@NoExpediente varchar(50), 	@NoProgresivo varchar(50), 		@Nombre varchar(100)
    DECLARE	@Destino varchar(50), 		@EstadoInmueble varchar(1),		@TipoInmueble varchar(1)
    DECLARE	@TipoAccion varchar(1),		@Observacion varchar(255)
    DECLARE	@DescripcionError nvarchar(255)
    DECLARE 	@RegACargar numeric(6),	@RegError numeric(6)
    
    SET NOCOUNT ON
    PRINT 'ANEXO3IX'
    UPDATE ANEXO3IX SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario
    DECLARE Carga CURSOR
    FOR SELECT	NoExpediente, NoProgresivo, Nombre, Destino, EstadoInmueble, TipoInmueble, TipoAccion, Observaciones
        FROM	PasoAnexo3IX
        WHERE	IdFuncionario = @IdFuncionario
	
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo3IX WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @NoExpediente, @NoProgresivo, @Nombre, @Destino, @EstadoInmueble, @TipoInmueble, @TipoAccion, @Observacion
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
            IF (@EstadoInmueble = '1' OR @EstadoInmueble = '2' OR @EstadoInmueble = '3') and (@TipoInmueble = '1' OR @TipoInmueble = '2' OR @TipoInmueble = '3') and (@TipoAccion = '1' OR @TipoAccion = '2' OR @TipoAccion = '3'  OR @TipoAccion = '4' )
            BEGIN
                INSERT INTO Anexo3IX(IdFuncionario, NoExpediente, NoProgresivo, Nombre, Destino, EstadoInmueble, TipoInmueble, TipoAccion,  Observaciones, UltimaCarga) 
                VALUES(@IdFuncionario, LTRIM(RTRIM(@NoExpediente)), LTRIM(RTRIM(@NoProgresivo)), LTRIM(RTRIM(@Nombre)), LTRIM(RTRIM(@Destino)), @EstadoInmueble, @TipoInmueble, @TipoAccion, LTRIM(RTRIM(@Observacion)), 1 )
                IF (@@ERROR <> 0)
                BEGIN
                    SET @RegError = @RegError + 1
                    SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
                    
                    INSERT INTO ErrAnexo3IX(IdFuncionario, NoExpediente, NoProgresivo, Nombre, Destino, EstadoInmueble, TipoInmueble, TipoAccion, Observaciones, DescripcionError)
                    VALUES(@IdFuncionario, @NoExpediente, @NoProgresivo, @Nombre, @Destino, @EstadoInmueble, @TipoInmueble, @TipoAccion, @Observacion, @DescripcionError)
                END
            END 
            ELSE
            BEGIN
                SET @RegError = @RegError + 1
                INSERT INTO ErrAnexo3IX(IdFuncionario, NoExpediente, NoProgresivo, Nombre, Destino, EstadoInmueble, TipoInmueble, TipoAccion,  Observaciones, DescripcionError) 
                VALUES(@IdFuncionario, @NoExpediente, @NoProgresivo, @Nombre, @Destino, @EstadoInmueble, @TipoInmueble, @TipoAccion, @Observacion, 'Estado de Inmueble , Tipo de Inmueble deben ser  1, 2 o 3 y  Tipo de Accion  debe ser 1, 2, 3 o 4')
            END
   
        FETCH NEXT FROM Carga INTO @NoExpediente, @NoProgresivo, @Nombre, @Destino, @EstadoInmueble, @TipoInmueble, @TipoAccion,  @Observacion
    END
	
    DELETE PasoAnexo3IX WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE  PROCEDURE [CargaAnexo3V1](@IdFuncionario  numeric)
AS 
    DECLARE 	@NoInventario varchar(20), 	@Descripcion varchar(50), 	@Marca varchar(20)
    DECLARE	@Modelo varchar(20), 		@Serie varchar(20),		@Valor varchar(20)
    DECLARE	@Ubicacion varchar(50), 	@Resguardante varchar(150),	@Tipo varchar(1),	@DescripcionError varchar(255)	
    DECLARE 	@RegACargar numeric(6),		@RegError numeric(6)
    DECLARE	@nValor numeric(22,2)
    SET NOCOUNT ON
    PRINT 'ANEXO3V1'
    UPDATE ANEXO3V1 SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario
    DECLARE Carga CURSOR
        FOR SELECT	NoInventario, Descripcion, Marca, Modelo, Serie, Valor, Ubicacion, Resguardante, Tipo
        FROM	PasoAnexo3V1
        WHERE	IdFuncionario = @IdFuncionario
	
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo3V1 WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @NoInventario, @Descripcion, @Marca, @Modelo, @Serie, @Valor, @Ubicacion, @Resguardante, @Tipo
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        IF LTRIM(@Valor) = '' SET @Valor = '0'
        SET @Valor = REPLACE(@Valor,',','')
        SET @Valor = REPLACE(@Valor,'$','')
        IF ISNUMERIC(@Valor)= 1 AND ISNUMERIC(@Tipo) = 1
        BEGIN
            IF @Tipo = '1' OR @Tipo = '2' OR @Tipo = '3' OR @Tipo = '4' OR @Tipo = '5' OR @Tipo = '6' OR @Tipo = '7'
            BEGIN
                SET @nValor = CAST(@Valor AS NUMERIC(22, 2))
                SET @Valor = substring(ltrim(CAST(@nValor AS nvarchar(23))),1,20)
                INSERT INTO Anexo3V1(IdFuncionario, NoInventario, Descripcion, Marca, Modelo, Serie, Valor, Ubicacion, Resguardante, Tipo, UltimaCarga) 
                VALUES(@IdFuncionario, LTRIM(RTRIM(@NoInventario)), LTRIM(RTRIM(@Descripcion)), LTRIM(RTRIM(@Marca)), LTRIM(RTRIM(@Modelo)), LTRIM(RTRIM(@Serie)), @Valor, LTRIM(RTRIM(@Ubicacion)), LTRIM(RTRIM(@Resguardante)), @Tipo, 1)
                IF (@@ERROR <> 0) 
                BEGIN
                    SET @RegError = @RegError + 1
                    SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
                    
                    INSERT INTO ErrAnexo3V1(IdFuncionario, NoInventario, Descripcion, Marca, Modelo, Serie, Valor, Ubicacion, Resguardante, Tipo, DescripcionError) 
                    VALUES(@IdFuncionario, @NoInventario, @Descripcion, @Marca, @Modelo, @Serie, @Valor, @Ubicacion, @Resguardante, @Tipo, @DescripcionError)
                END
            END
            ELSE
            BEGIN
                SET @RegError = @RegError + 1
                INSERT INTO ErrAnexo3V1(IdFuncionario, NoInventario, Descripcion, Marca, Modelo, Serie, Valor, Ubicacion, Resguardante, Tipo, DescripcionError) 
                VALUES(@IdFuncionario, @NoInventario, @Descripcion, @Marca, @Modelo, @Serie, @Valor, @Ubicacion, @Resguardante, @Tipo, 'Tipo debe de ser 1,2,3,4,5,6 o 7')
            END
        END
        ELSE
        BEGIN
            SET @RegError = @RegError + 1
            INSERT INTO ErrAnexo3V1(IdFuncionario, NoInventario, Descripcion, Marca, Modelo, Serie, Valor, Ubicacion, Resguardante, Tipo, DescripcionError) 
            VALUES(@IdFuncionario, @NoInventario, @Descripcion, @Marca, @Modelo, @Serie, @Valor, @Ubicacion, @Resguardante, @Tipo, 'Valor y Tipo deben de ser Numérico')
        END
        FETCH NEXT FROM Carga INTO @NoInventario, @Descripcion, @Marca, @Modelo, @Serie, @Valor, @Ubicacion, @Resguardante, @Tipo
    END
		
    DELETE PasoAnexo3V1 WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE  PROCEDURE [CargaAnexo3V2](@IdFuncionario  numeric)
AS 
    DECLARE 	@Clave varchar(20), 		@NumFactura varchar(20), 	@Fecha varchar(10)
    DECLARE	@Concepto varchar(50),	 	@Importe varchar(50),		@Tipo varchar(1),	@DescripcionError varchar(255)
    DECLARE 	@RegACargar numeric(6),		@RegError numeric(6)
    DECLARE	@nImporte numeric(22,2)
    
    SET NOCOUNT ON
    
    PRINT 'ANEXO3V2'
    UPDATE ANEXO3V2 SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario
    DECLARE Carga CURSOR
        FOR SELECT	Clave, NumFactura, Fecha, Concepto, Importe, Tipo
        FROM	PasoAnexo3V2
        WHERE	IdFuncionario = @IdFuncionario
	
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo3V2 WHERE IdFuncionario = @IdFuncionario
    
    OPEN Carga
    FETCH NEXT FROM Carga INTO @Clave, @NumFactura, @Fecha, @Concepto, @Importe, @Tipo
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        IF LTRIM(@Importe) = '' SET @Importe = '0'
        SET @Importe = REPLACE(@Importe,',','')
        SET @Importe = REPLACE(@Importe,'$','')
        IF ISNUMERIC(@Importe) = 1 AND ISNUMERIC(@Tipo) = 1
        BEGIN
            SET @nImporte = CAST(@Importe AS NUMERIC(22, 2))
            SET @Importe = substring(ltrim(CAST(@nImporte AS nvarchar(23))),1,20)
            IF @Tipo = '1' OR @Tipo = '2' OR @Tipo = '3' OR @Tipo = '4'
            BEGIN
                INSERT INTO Anexo3V2(IdFuncionario, Clave, NumFactura, Fecha, Concepto, Importe, Tipo, UltimaCarga) 
                VALUES(@IdFuncionario, LTRIM(RTRIM(@Clave)), LTRIM(RTRIM(@NumFactura)), @Fecha, LTRIM(RTRIM(@Concepto)), @Importe, @Tipo, 1)
                IF (@@ERROR <> 0) 
                BEGIN
                    SET @RegError = @RegError + 1
                    SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
                    
                    INSERT INTO ErrAnexo3V2(IdFuncionario, Clave, NumFactura, Fecha, Concepto, Importe, Tipo, DescripcionError) 
                    VALUES(@IdFuncionario, @Clave, @NumFactura, @Fecha, @Concepto, @Importe, @Tipo, @DescripcionError)
                END
            END
            ELSE
            BEGIN
                SET @RegError = @RegError + 1
                INSERT INTO ErrAnexo3V2(IdFuncionario, Clave, NumFactura, Fecha, Concepto, Importe, Tipo, DescripcionError) 
                VALUES(@IdFuncionario, @Clave, @NumFactura, @Fecha, @Concepto, @Importe, @Tipo, 'Tipo debe de ser 1,2,3 o 4')
            END
        END
        ELSE
        BEGIN
            SET @RegError = @RegError + 1
            INSERT INTO ErrAnexo3V2(IdFuncionario, Clave, NumFactura, Fecha, Concepto, Importe, Tipo, DescripcionError) 
            VALUES(@IdFuncionario, @Clave, @NumFactura, @Fecha, @Concepto, @Importe, @Tipo, 'Importe y Tipo deben de ser Numérico')
        END
        FETCH NEXT FROM Carga INTO @Clave, @NumFactura, @Fecha, @Concepto, @Importe, @Tipo
    END
    DELETE PasoAnexo3V2 WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE  PROCEDURE [CargaAnexo3V3](@IdFuncionario  numeric)
AS 
    DECLARE 	@Clave varchar(20), 		@NumFactura varchar(20), 	@Fecha varchar(10)
    DECLARE	@Concepto varchar(50),		@Importe varchar(50),		@Tipo varchar(1), 	@DescripcionError varchar(255)
    DECLARE 	@RegACargar numeric(6),	@RegError numeric(6)
    DECLARE	@nImporte numeric(22,2)
    
    SET NOCOUNT ON
    PRINT 'ANEXO3V3'
    UPDATE ANEXO3V3 SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario
    DECLARE Carga CURSOR
        FOR SELECT	Clave, NumFactura, Fecha, Concepto, Importe, Tipo
        FROM	PasoAnexo3V3
        WHERE	IdFuncionario = @IdFuncionario
	
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo3V3 WHERE IdFuncionario = @IdFuncionario
    
    OPEN Carga
    FETCH NEXT FROM Carga INTO @Clave, @NumFactura, @Fecha, @Concepto, @Importe, @Tipo
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        IF LTRIM(@Importe) = '' SET @Importe = '0'
        SET @Importe = REPLACE(@Importe,',','')
        SET @Importe = REPLACE(@Importe,'$','')
        IF ISNUMERIC(@Importe) = 1 AND ISNUMERIC(@Tipo) = 1
        BEGIN
            SET @nImporte = CAST(@Importe AS NUMERIC(22, 2))
            SET @Importe = substring(ltrim(CAST(@nImporte AS nvarchar(23))),1,20)
            IF @Tipo = '1' OR @Tipo = '2' OR @Tipo = '3' OR @Tipo = '4'
            BEGIN
                INSERT INTO Anexo3V3(IdFuncionario, Clave, NumFactura, Fecha, Concepto, Importe, Tipo, UltimaCarga) 
                VALUES(@IdFuncionario, LTRIM(RTRIM(@Clave)), LTRIM(RTRIM(@NumFactura)), @Fecha, LTRIM(RTRIM(@Concepto)), @Importe, @Tipo, 1)
                IF (@@ERROR <> 0) 
                BEGIN
                    SET @RegError = @RegError + 1
                    SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR			
                    
                    INSERT INTO ErrAnexo3V3(IdFuncionario, Clave, NumFactura, Fecha, Concepto, Importe, Tipo, DescripcionError) 
                    VALUES(@IdFuncionario, @Clave, @NumFactura, @Fecha, @Concepto, @Importe, @Tipo, @DescripcionError)
                END
            END
            ELSE
            BEGIN
                SET @RegError = @RegError + 1
                INSERT INTO ErrAnexo3V3(IdFuncionario, Clave, NumFactura, Fecha, Concepto, Importe, Tipo, DescripcionError) 
                VALUES(@IdFuncionario, @Clave, @NumFactura, @Fecha, @Concepto, @Importe, @Tipo, 'Tipo debe de ser 1,2,3 o 4')
            END
        END
        ELSE
        BEGIN
            SET @RegError = @RegError + 1
            INSERT INTO ErrAnexo3V3(IdFuncionario, Clave, NumFactura, Fecha, Concepto, Importe, Tipo, DescripcionError) 
            VALUES(@IdFuncionario, @Clave, @NumFactura, @Fecha, @Concepto, @Importe, @Tipo, 'Importe y Tipo deben de ser Numérico')
        END
        FETCH NEXT FROM Carga INTO @Clave, @NumFactura, @Fecha, @Concepto, @Importe, @Tipo
    END
    
    DELETE PasoAnexo3V3 WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE  PROCEDURE [CargaAnexo3V4](@IdFuncionario  numeric)
AS 
    DECLARE	@NoInventario varchar(20), 	@NoEconomico varchar(10), 		@Marca varchar(20)
    DECLARE	@Modelo varchar(20), 		@Color varchar(20),			@Placas varchar(15)
    DECLARE	@Tipo varchar(1),		@Serie varchar(20),			@Resguardante varchar(150)
    DECLARE	@Observacion varchar(255),	@DescripcionError varchar(255)
    DECLARE 	@RegACargar numeric(6),	@RegError numeric(6)
    
    SET NOCOUNT ON
    PRINT 'ANEXO3V4'
    UPDATE ANEXO3V4 SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario
    DECLARE Carga CURSOR
    FOR SELECT	NoInventario, NoEconomico, Marca, Modelo, Color, Placas, Tipo, Serie, Resguardante, Observacion
        FROM	PasoAnexo3V4
        WHERE	IdFuncionario = @IdFuncionario
	
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo3V4 WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @NoInventario, @NoEconomico, @Marca, @Modelo, @Color, @Placas, @Tipo, @Serie, @Resguardante, @Observacion
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        IF @Tipo = '1' OR @Tipo = '2' OR @Tipo = '3' OR @Tipo = '4' OR @Tipo = '5' OR @Tipo = '6' OR @Tipo = '7' OR @Tipo = '8'
        BEGIN
            INSERT INTO Anexo3V4(IdFuncionario, NoInventario, NoEconomico, Marca, Modelo, Color, Placas, Tipo, Serie, Resguardante, Observaciones, UltimaCarga)
            VALUES(@IdFuncionario, LTRIM(RTRIM(@NoInventario)), LTRIM(RTRIM(@NoEconomico)), LTRIM(RTRIM(@Marca)), LTRIM(RTRIM(@Modelo)), LTRIM(RTRIM(@Color)), LTRIM(RTRIM(@Placas)), @Tipo, LTRIM(RTRIM(@Serie)), LTRIM(RTRIM(@Resguardante)), LTRIM(RTRIM(@Observacion)), 1)
            IF (@@ERROR <> 0)
            BEGIN
                SET @RegError = @RegError + 1
                SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
                
                INSERT INTO ErrAnexo3V4(IdFuncionario, NoInventario, NoEconomico, Marca, Modelo, Color, Placas, Tipo, Serie, Resguardante, Observacion, DescripcionError)
                VALUES(@IdFuncionario, @NoInventario, @NoEconomico, @Marca, @Modelo, @Color, @Placas, @Tipo, @Serie, @Resguardante, @Observacion, @DescripcionError)
            END
        END
        ELSE
        BEGIN
            SET @RegError = @RegError + 1
            INSERT INTO ErrAnexo3V4(IdFuncionario, NoInventario, NoEconomico, Marca, Modelo, Color, Placas, Tipo, Serie, Resguardante, Observacion, DescripcionError)
            VALUES(@IdFuncionario, @NoInventario, @NoEconomico, @Marca, @Modelo, @Color, @Placas, @Tipo, @Serie, @Resguardante, @Observacion,'Tipo debe ser 1,2,3,4,5,6,7 u 8')
        END
        FETCH NEXT FROM Carga INTO @NoInventario, @NoEconomico, @Marca, @Modelo, @Color, @Placas, @Tipo, @Serie, @Resguardante, @Observacion
    END
    
    DELETE PasoAnexo3V4 WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE  PROCEDURE [CargaAnexo3V5](@IdFuncionario  numeric)
AS 
    DECLARE @Clave varchar(20), @Calibre varchar(20), @Matricula varchar(50), @Nombre varchar(50), @Cargo varchar(100), @DescripcionError varchar(255)
    DECLARE 	@RegACargar numeric(6),		@RegError numeric(6)
    
    SET NOCOUNT ON
    PRINT 'ANEXO3V5'
    UPDATE ANEXO3V5 SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario
    DECLARE Carga CURSOR  
        FOR SELECT		Clave, Calibre, Matricula, Nombre, Cargo
        FROM		PasoAnexo3V5
        WHERE	IdFuncionario = @IdFuncionario
        
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo3V5 WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @Clave, @Calibre, @Matricula, @Nombre, @Cargo
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        INSERT INTO Anexo3V5(IdFuncionario, Clave, Calibre, Matricula, Nombre, Cargo, UltimaCarga) 
        VALUES(@IdFuncionario, LTRIM(RTRIM(@Clave)), LTRIM(RTRIM(@Calibre)), LTRIM(RTRIM(@Matricula)), LTRIM(RTRIM(@Nombre)), LTRIM(RTRIM(@Cargo)), 1)
        IF (@@ERROR <> 0) 
        BEGIN
            SET @RegError = @RegError + 1
            SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
            
            INSERT INTO ErrAnexo3V5(IdFuncionario, Clave, Calibre, Matricula, Nombre, Cargo, DescripcionError) 
            VALUES(@IdFuncionario, @Clave, @Calibre, @Matricula, @Nombre, @Cargo, @DescripcionError)
        END
        FETCH NEXT FROM Carga INTO @Clave, @Calibre, @Matricula, @Nombre, @Cargo
    END
    DELETE PasoAnexo3V5 WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE  PROCEDURE [CargaAnexo3V6](@IdFuncionario  numeric)
AS 
    DECLARE 	@Clave varchar(20), 		@NumFactura varchar(20), 	@Fecha varchar(10)
    DECLARE	@Concepto varchar(50), 	@Importe varchar(50),		@Tipo varchar(1), 	@DescripcionError varchar(255)
    DECLARE 	@RegACargar numeric(6),	@RegError numeric(6)
    DECLARE	@nImporte numeric(22,2)
    
    SET NOCOUNT ON
    PRINT 'ANEXO3V6'
    UPDATE ANEXO3V6 SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario
    DECLARE Carga CURSOR
        FOR SELECT	Clave, NumFactura, Fecha, Concepto, Importe, Tipo
        FROM	PasoAnexo3V6
    WHERE	IdFuncionario = @IdFuncionario
    
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo3V6 WHERE IdFuncionario = @IdFuncionario
    
    OPEN Carga
    FETCH NEXT FROM Carga INTO @Clave, @NumFactura, @Fecha, @Concepto, @Importe, @Tipo
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        IF LTRIM(@Importe) = '' SET @Importe = '0'
        SET @Importe = REPLACE(@Importe,',','')
        SET @Importe = REPLACE(@Importe,'$','')
        IF ISNUMERIC(@Importe) = 1 AND ISNUMERIC(@Tipo) = 1
        BEGIN
            SET @nImporte = CAST(@Importe AS NUMERIC(22, 2))
            SET @Importe = substring(ltrim(CAST(@nImporte AS nvarchar(23))),1,20)
            IF @Tipo = '1' OR @Tipo = '2' OR @Tipo = '3' OR @Tipo = '4'
            BEGIN
                INSERT INTO Anexo3V6(IdFuncionario, Clave, NumFactura, Fecha, Concepto, Importe, Tipo, UltimaCarga) 
                VALUES(@IdFuncionario, LTRIM(RTRIM(@Clave)), LTRIM(RTRIM(@NumFactura)), @Fecha, LTRIM(RTRIM(@Concepto)), @Importe, @Tipo, 1)
                IF (@@ERROR <> 0) 
                BEGIN
                    SET @RegError = @RegError + 1
                    SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
                    
                    INSERT INTO ErrAnexo3V6(IdFuncionario, Clave, NumFactura, Fecha, Concepto, Importe, Tipo, DescripcionError) 
                    VALUES(@IdFuncionario, @Clave, @NumFactura, @Fecha, @Concepto, @Importe, @Tipo, @DescripcionError)
                END
            END
            ELSE
            BEGIN
                SET @RegError = @RegError + 1
                INSERT INTO ErrAnexo3V6(IdFuncionario, Clave, NumFactura, Fecha, Concepto, Importe, Tipo, DescripcionError) 
                VALUES(@IdFuncionario, @Clave, @NumFactura, @Fecha, @Concepto, @Importe, @Tipo, 'Tipo debe de ser 1,2,3 o 4')
            END
        END
        ELSE
        BEGIN
            SET @RegError = @RegError + 1
            INSERT INTO ErrAnexo3V6(IdFuncionario, Clave, NumFactura, Fecha, Concepto, Importe, Tipo, DescripcionError) 
            VALUES(@IdFuncionario, @Clave, @NumFactura, @Fecha, @Concepto, @Importe, @Tipo,'Importe y Tipo deben de ser Numérico')
        END
        FETCH NEXT FROM Carga INTO @Clave, @NumFactura, @Fecha, @Concepto, @Importe, @Tipo
    END
    DELETE PasoAnexo3V6 WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE  PROCEDURE [CargaAnexo3V7](@IdFuncionario  numeric)
AS 
    DECLARE	@Titulo varchar(50), 		@Fecha varchar(10), 			@Autores varchar(255)
    DECLARE	@Nombre varchar(50),		@Tipo varchar(1)		
    DECLARE	@Departamento	varchar(100),	@DescripcionError nvarchar(255)
    DECLARE 	@RegACargar numeric(6),	@RegError numeric(6)
    
    SET NOCOUNT ON
    PRINT 'ANEXO3V7'
    UPDATE ANEXO3V7 SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario
    DECLARE Carga CURSOR
    FOR SELECT	Titulo, Fecha, Autores, Nombre, Departamento, Tipo
        FROM	PasoAnexo3V7
        WHERE	IdFuncionario = @IdFuncionario
	
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo3V7 WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @Titulo, @Fecha, @Autores, @Nombre, @Departamento, @Tipo
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        IF ISNUMERIC(@Tipo) = 1
        BEGIN
                    
                INSERT INTO Anexo3V7(IdFuncionario, Titulo, Fecha, Autores, Nombre, Departamento, Tipo, UltimaCarga) 
                VALUES(@IdFuncionario, LTRIM(RTRIM(@Titulo)), LTRIM(RTRIM(@Fecha)), LTRIM(RTRIM(@Autores)), LTRIM(RTRIM(@Nombre)), LTRIM(RTRIM(@Departamento)), LTRIM(RTRIM(@Tipo)), 1)
                IF (@@ERROR <> 0)
                BEGIN
                    SET @RegError = @RegError + 1
                    SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
                    
                    INSERT INTO ErrAnexo3V7(IdFuncionario, Titulo, Fecha, Autores, Nombre, Departamento, Tipo, DescripcionError)
                    VALUES(@IdFuncionario, @Titulo, @Fecha, @Autores, @Nombre, @Departamento, @Tipo, @DescripcionError)
                END
            END 
        ELSE
        BEGIN
            SET @RegError = @RegError + 1
            INSERT INTO ErrAnexo3V7(IdFuncionario, Titulo, Fecha, Autores, Nombre, Departamento, Tipo, DescripcionError)
            VALUES(@IdFuncionario, @Titulo, @Fecha, @Autores, @Nombre, @Departamento, @Tipo, 'Tipo debe ser Numérico')
        END
        FETCH NEXT FROM Carga INTO @Titulo, @Fecha, @Autores, @Nombre, @Departamento, @Tipo
    END
	
    DELETE PasoAnexo3V7 WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE  PROCEDURE [CargaAnexo3VI](@IdFuncionario  numeric)
AS 
    DECLARE 	@NoNombre varchar(100),	@Unidad varchar(20),	@PrecioUnitario varchar(20)
    DECLARE	@Existencia varchar(20), 	@Importe varchar(20), 	@Observacion varchar(255),   @DescripcionError varchar(255)
    DECLARE 	@RegACargar numeric(6),	@RegError numeric(6)
    DECLARE	@nImporte numeric(22,2)	,	@nExistencia numeric(22,2), @nPrecioUnitario numeric(22,2)
    SET NOCOUNT ON 
    PRINT 'ANEXO3VI'
    UPDATE ANEXO3VI SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario        
    DECLARE Carga CURSOR  
        FOR SELECT NoNombre, Unidad, PrecioUnitario, Existencia, Importe,Observacion
        FROM	PasoAnexo3VI
        WHERE	IdFuncionario = @IdFuncionario
    
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo3VI WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @NoNombre, @Unidad, @PrecioUnitario, @Existencia, @Importe,@Observacion
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        IF LTRIM(@Importe) = '' SET @Importe = '0'
        SET @Importe = REPLACE(@Importe,',','')
        SET @Importe = REPLACE(@Importe,'$','')
        IF LTRIM(@PrecioUnitario) = '' SET @PrecioUnitario = '0'
        SET @PrecioUnitario = REPLACE(@PrecioUnitario,',','')
        SET @PrecioUnitario = REPLACE(@PrecioUnitario,'$','')
        IF LTRIM(@Existencia) = '' SET @Existencia = '0'
        SET @Existencia = REPLACE(@Existencia,',','')
        SET @Existencia = REPLACE(@Existencia,'$','')
        IF ISNUMERIC(@Importe) = 1  AND ISNUMERIC(@Existencia) = 1  AND ISNUMERIC(@PrecioUnitario) = 1
        BEGIN
            SET @nImporte = CAST(@Importe AS NUMERIC(22, 2))
            SET @Importe = substring(ltrim(CAST(@nImporte AS nvarchar(23))),1,20)
            
            SET @nPrecioUnitario = CAST(@PrecioUnitario AS NUMERIC(22, 2))
            SET @PrecioUnitario = substring(ltrim(CAST(@nPrecioUnitario AS nvarchar(23))),1,20)
            SET @nExistencia = CAST(@Existencia AS NUMERIC(22, 2))
            SET @Existencia = substring(ltrim(CAST(@nExistencia AS nvarchar(23))),1,20)
            INSERT INTO Anexo3VI(IdFuncionario, NoNombre, Unidad, PrecioUnitario, Existencia, Importe,Observacion, UltimaCarga) 
            VALUES(@IdFuncionario, LTRIM(RTRIM(@NoNombre)), LTRIM(RTRIM(@Unidad)), LTRIM(RTRIM(@PrecioUnitario)), LTRIM(RTRIM(@Existencia)), LTRIM(RTRIM(@Importe)) , LTRIM(RTRIM(@Observacion)), 1 )
            IF (@@ERROR <> 0)
            BEGIN
                SET @RegError = @RegError + 1
                SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
                INSERT INTO ErrAnexo3VI(IdFuncionario, NoNombre, Unidad, PrecioUnitario, Existencia, Importe,Observacion, DescripcionError) 
                VALUES(@IdFuncionario, @NoNombre, @Unidad, @PrecioUnitario, @Existencia, @Importe,@Observacion, @DescripcionError)
       	 END
       END
       ELSE
       BEGIN
            SET @RegError = @RegError + 1
             INSERT INTO ErrAnexo3VI(IdFuncionario, NoNombre, Unidad, PrecioUnitario, Existencia, Importe,Observacion, DescripcionError) 
           	VALUES(@IdFuncionario, @NoNombre, @Unidad, @PrecioUnitario, @Existencia, @Importe,@Observacion, 'Precio Unitario ,Existencia y Importe deben de ser Numéricos')
        END
        FETCH NEXT FROM Carga INTO @NoNombre, @Unidad, @PrecioUnitario, @Existencia, @Importe,@Observacion
    END
    DELETE PasoAnexo3VI WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE  PROCEDURE [CargaAnexo3X](@IdFuncionario  numeric)
AS 
    DECLARE	@Clave varchar(20), 			@Programa varchar(100), 	@Tipo varchar(1)
    DECLARE	@MontoAprobado varchar(20), 		@MontoEjercido varchar(20),	@FechaInicial varchar(10)
    DECLARE	@FechaFinal varchar(10),		@AvanceFisico varchar(5),	@AvanceFinanciero varchar(5)
    DECLARE	@Observacion varchar(255),		@TipoOrigen varchar(1)
    DECLARE	@DescripcionError nvarchar(255)
    DECLARE 	@RegACargar numeric(6),		@RegError numeric(6)
   DECLARE	@nMontoAprobado numeric(22,2),	@nMontoEjercido numeric(22,2)
    DECLARE	@nAvanceFisico numeric(22,2),		@nAvanceFinanciero numeric(22,2)
    
    SET NOCOUNT ON
    PRINT 'ANEXO3X'
    UPDATE ANEXO3X SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario 
    DECLARE Carga CURSOR
    FOR SELECT	Clave, Programa, Tipo, MontoAprobado, MontoEjercido, FechaInicial, FechaFinal, AvanceFisico, AvanceFinanciero, Observacion ,TipoOrigen
        FROM	PasoAnexo3X
        WHERE	IdFuncionario = @IdFuncionario
	
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo3X WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @Clave, @Programa, @Tipo, @MontoAprobado, @MontoEjercido, @FechaInicial, @FechaFinal,@AvanceFisico, @AvanceFinanciero, @Observacion,@TipoOrigen
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        IF LTRIM(@MontoAprobado) = '' SET @MontoAprobado = '0'
        SET @MontoAprobado = REPLACE(@MontoAprobado,',','')
        SET @MontoAprobado= REPLACE(@MontoAprobado,'$','')
        
        IF LTRIM(@MontoEjercido) = '' SET @MontoEjercido = '0'
        SET @MontoEjercido = REPLACE(@MontoEjercido,',','')
        SET @MontoEjercido = REPLACE(@MontoEjercido,'$','')
       
         IF LTRIM(@AvanceFisico) = '' SET @AvanceFisico = '0'
        SET @AvanceFisico = REPLACE(@AvanceFisico,',','')
        SET @AvanceFisico = REPLACE(@AvanceFisico,'$','')
        
        IF LTRIM(@AvanceFinanciero) = '' SET @AvanceFinanciero = '0'
        SET @AvanceFinanciero = REPLACE(@AvanceFinanciero,',','')
        SET @AvanceFinanciero = REPLACE(@AvanceFinanciero,'$','')
        IF ISNUMERIC(@MontoAprobado) = 1  AND ISNUMERIC(@MontoEjercido) = 1 AND ISNUMERIC(@AvanceFisico) = 1 AND ISNUMERIC(@AvanceFinanciero) = 1
        BEGIN
            SET @nMontoAprobado = CAST(@MontoAprobado AS NUMERIC(22, 2))
            SET @MontoAprobado = substring(ltrim(CAST(@nMontoAprobado AS nvarchar(23))),1,20)
            SET @nMontoEjercido = CAST(@MontoEjercido AS NUMERIC(22, 2))
            SET @MontoEjercido = substring(ltrim(CAST(@nMontoEjercido AS nvarchar(23))),1,20)
	
	SET @nAvanceFisico = CAST(@AvanceFisico AS NUMERIC(22, 2))
            SET @AvanceFisico = substring(ltrim(CAST(@nAvanceFisico AS nvarchar(23))),1,20)
            SET @nAvanceFinanciero = CAST(@AvanceFinanciero AS NUMERIC(22, 2))
            SET @AvanceFinanciero = substring(ltrim(CAST(@nAvanceFinanciero AS nvarchar(23))),1,20)
          		  IF (@Tipo = '1' OR @Tipo = '2' ) and (LTRIM(RTRIM(@TipoOrigen)) = '1' OR  LTRIM(RTRIM(@TipoOrigen)) = '2' OR  LTRIM(RTRIM(@TipoOrigen ))= '3' OR  LTRIM(RTRIM(@TipoOrigen)) = '4' OR  LTRIM(RTRIM(@TipoOrigen ))= '5') 
         		  BEGIN
          		      	INSERT INTO Anexo3X(IdFuncionario, Clave, Programa, Tipo, MontoAprobado, MontoEjercido, FechaInicial, FechaFinal, AvanceFisico, AvanceFinanciero, Observacion ,TipoOrigen, UltimaCarga) 
       		        	 VALUES(@IdFuncionario, LTRIM(RTRIM(@Clave)), LTRIM(RTRIM(@Programa)), @Tipo , LTRIM(RTRIM(@MontoAprobado)),  LTRIM(RTRIM(@MontoEjercido)),  LTRIM(RTRIM(@FechaInicial)),  LTRIM(RTRIM(@FechaFinal )),   LTRIM(RTRIM(@AvanceFisico))  ,   LTRIM(RTRIM(@AvanceFinanciero))  ,   LTRIM(RTRIM(@Observacion))  ,   LTRIM(RTRIM(@TipoOrigen)), 1 )
          		     	 IF (@@ERROR <> 0)
         		     	 BEGIN
            		             		 SET @RegError = @RegError + 1
           		            		  SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
                    
            		            		  INSERT INTO ErrAnexo3X(IdFuncionario,Clave, Programa, Tipo, MontoAprobado, MontoEjercido, FechaInicial, FechaFinal, AvanceFisico, AvanceFinanciero, Observacion ,TipoOrigen, DescripcionError)
              		     	 VALUES(@IdFuncionario,  @Clave, @Programa, @Tipo, @MontoAprobado, @MontoEjercido, @FechaInicial, @FechaFinal,@AvanceFisico, @AvanceFinanciero, @Observacion,@TipoOrigen, @DescripcionError)
            		   	 END
           		 END 
         		 ELSE
         		 BEGIN
           		     SET @RegError = @RegError + 1
          		      INSERT INTO ErrAnexo3X(IdFuncionario, Clave, Programa, Tipo, MontoAprobado, MontoEjercido, FechaInicial, FechaFinal, AvanceFisico, AvanceFinanciero, Observacion ,TipoOrigen, DescripcionError) 
          		      VALUES(@IdFuncionario,  @Clave, @Programa, @Tipo, @MontoAprobado, @MontoEjercido, @FechaInicial, @FechaFinal,@AvanceFisico, @AvanceFinanciero, @Observacion,@TipoOrigen, 'Tipo debe ser 1, 2  y Tipo de Origen debe ser 1, 2 , 3 , 4 o 5' )
       		 END
       END
       ELSE
       BEGIN
            SET @RegError = @RegError + 1
             INSERT INTO ErrAnexo3X(IdFuncionario, Clave, Programa, Tipo, MontoAprobado, MontoEjercido, FechaInicial, FechaFinal, AvanceFisico, AvanceFinanciero, Observacion ,TipoOrigen, DescripcionError) 
           	VALUES(@IdFuncionario, @Clave, @Programa, @Tipo, @MontoAprobado, @MontoEjercido, @FechaInicial, @FechaFinal,@AvanceFisico, @AvanceFinanciero, @Observacion,@TipoOrigen,  'Monto Aprobado, Monto Ejercido, Avance Físico y Avance Financiero deben ser Numéricos')
        END
   
        FETCH NEXT FROM Carga INTO @Clave, @Programa, @Tipo, @MontoAprobado, @MontoEjercido, @FechaInicial, @FechaFinal,@AvanceFisico, @AvanceFinanciero, @Observacion,@TipoOrigen
    END
	
    DELETE PasoAnexo3X WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE  PROCEDURE [CargaAnexo3XI](@IdFuncionario  numeric)
AS 
    DECLARE	@Clave varchar(20), 			@Programa varchar(100), 	@NoAprobacion varchar(20)
    DECLARE	@InversionAprobada varchar(20), 	@InversionEjercida varchar(20),	@UnidadMedida varchar(30)
    DECLARE	@CantidadTotal varchar(10),		@ObrasEntregadas varchar(9),	@ObrasPorEntregar varchar(9)
    DECLARE	@Observacion varchar(255),		@TipoOrigen varchar(1)
    DECLARE	@DescripcionError nvarchar(255)
    DECLARE 	@RegACargar numeric(6),		@RegError numeric(6)
    DECLARE	@nInversionAprobada numeric(22,2),	@nInversionEjercida numeric(22,2),		@nCantidadTotal numeric(22,2)
    DECLARE	@nObrasEntregadas numeric(22,2),	@nObrasPorEntregar numeric(22,2)
    
    SET NOCOUNT ON
    PRINT 'ANEXO3XI'
    UPDATE ANEXO3XI SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario 
    DECLARE Carga CURSOR
    FOR SELECT	Clave, Programa, NoAprobacion, InversionAprobada, InversionEjercida, ObrasEntregadas, ObrasPorEntregar, UnidadMedida, CantidadTotal, Observacion ,TipoOrigen
        FROM	PasoAnexo3XI
        WHERE	IdFuncionario = @IdFuncionario
	
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo3XI WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @Clave, @Programa, @NoAprobacion, @InversionAprobada, @InversionEjercida, @ObrasEntregadas, @ObrasPorEntregar, @UnidadMedida, @CantidadTotal, @Observacion,@TipoOrigen
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        IF LTRIM(@InversionAprobada) = '' SET @InversionAprobada = '0'
        SET @InversionAprobada = REPLACE(@InversionAprobada,',','')
        SET @InversionAprobada= REPLACE(@InversionAprobada,'$','')
        
        IF LTRIM(@InversionEjercida) = '' SET @InversionEjercida = '0'
        SET @InversionEjercida = REPLACE(@InversionEjercida,',','')
        SET @InversionEjercida = REPLACE(@InversionEjercida,'$','')
       
         IF LTRIM(@ObrasEntregadas) = '' SET @ObrasEntregadas = '0'
        SET @ObrasEntregadas = REPLACE(@ObrasEntregadas,',','')
        SET @ObrasEntregadas = REPLACE(@ObrasEntregadas,'$','')
        
        IF LTRIM(@ObrasPorEntregar) = '' SET @ObrasPorEntregar = '0'
        SET @ObrasPorEntregar = REPLACE(@ObrasPorEntregar,',','')
        SET @ObrasPorEntregar = REPLACE(@ObrasPorEntregar,'$','')
	
         IF LTRIM(@CantidadTotal) = '' SET @CantidadTotal = '0'
        SET @CantidadTotal = REPLACE(@CantidadTotal,',','')
        SET @CantidadTotal = REPLACE(@CantidadTotal,'$','')
        IF ISNUMERIC(@InversionAprobada) = 1  AND ISNUMERIC(@InversionEjercida) = 1 AND ISNUMERIC(@ObrasEntregadas) = 1 AND ISNUMERIC(@ObrasPorEntregar) = 1 AND ISNUMERIC(@CantidadTotal) = 1
        BEGIN
            SET @nInversionAprobada = CAST(@InversionAprobada AS NUMERIC(22, 2))
            SET @InversionAprobada = substring(ltrim(CAST(@nInversionAprobada AS nvarchar(23))),1,20)
            SET @nInversionEjercida = CAST(@InversionEjercida AS NUMERIC(22, 2))
            SET @InversionEjercida = substring(ltrim(CAST(@nInversionEjercida AS nvarchar(23))),1,20)
	
            SET @nObrasEntregadas = CAST(@ObrasEntregadas AS NUMERIC(22, 2))
            SET @ObrasEntregadas = substring(ltrim(CAST(@nObrasEntregadas AS nvarchar(23))),1,20)
            SET @nObrasPorEntregar = CAST(@ObrasPorEntregar AS NUMERIC(22, 2))
            SET @ObrasPorEntregar = substring(ltrim(CAST(@nObrasPorEntregar AS nvarchar(23))),1,20)
            SET @nCantidadTotal = CAST(@CantidadTotal AS NUMERIC(22, 2))
            SET @CantidadTotal = substring(ltrim(CAST(@nCantidadTotal AS nvarchar(23))),1,20)
		  IF  LTRIM(RTRIM(@TipoOrigen)) = '1' OR  LTRIM(RTRIM(@TipoOrigen)) = '2' OR  LTRIM(RTRIM(@TipoOrigen ))= '3' OR  LTRIM(RTRIM(@TipoOrigen)) = '4' OR  LTRIM(RTRIM(@TipoOrigen ))= '5'	
         		   BEGIN
          		      INSERT INTO Anexo3XI(IdFuncionario, Clave, Programa, NoAprobacion, InversionAprobada, InversionEjercida, UnidadMedida, CantidadTotal, ObrasEntregadas, ObrasPorEntregar, Observacion ,TipoOrigen, UltimaCarga) 
       		         VALUES(@IdFuncionario, LTRIM(RTRIM(@Clave)), LTRIM(RTRIM(@Programa)), LTRIM(RTRIM(@NoAprobacion)) , LTRIM(RTRIM(@InversionAprobada)),  LTRIM(RTRIM(@InversionEjercida)), LTRIM(RTRIM(@UnidadMedida)), LTRIM(RTRIM(@CantidadTotal)), LTRIM(RTRIM(@ObrasEntregadas)), LTRIM(RTRIM(@ObrasPorEntregar)), LTRIM(RTRIM(@Observacion)), LTRIM(RTRIM(@TipoOrigen)), 1 )
          		      IF (@@ERROR <> 0)
         		       BEGIN
            		        SET @RegError = @RegError + 1
           		         SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
                    
            		        INSERT INTO ErrAnexo3XI(IdFuncionario, Clave, Programa, NoAprobacion,  InversionAprobada, InversionEjercida, ObrasEntregadas, ObrasPorEntregar, UnidadMedida, CantidadTotal, Observacion ,TipoOrigen, DescripcionError)
              		      VALUES(@IdFuncionario,  @Clave, @Programa, @NoAprobacion, @InversionAprobada, @InversionEjercida, @ObrasEntregadas, @ObrasPorEntregar,@UnidadMedida, @CantidadTotal, @Observacion,@TipoOrigen, @DescripcionError)
            		    END
           		 END 
         		   ELSE
         		   BEGIN
           		     SET @RegError = @RegError + 1
          		      INSERT INTO ErrAnexo3XI(IdFuncionario, Clave, Programa, NoAprobacion,  InversionAprobada, InversionEjercida, ObrasEntregadas, ObrasPorEntregar, UnidadMedida, CantidadTotal, Observacion ,TipoOrigen, DescripcionError) 
          		      VALUES(@IdFuncionario,  @Clave, @Programa, @NoAprobacion, @InversionAprobada, @InversionEjercida, @ObrasEntregadas, @ObrasPorEntregar,@UnidadMedida, @CantidadTotal, @Observacion,@TipoOrigen, ' Tipo de Origen debe de ser 1, 2 , 3 , 4 o 5' )
       		     END
       END
       ELSE
       BEGIN
            SET @RegError = @RegError + 1
             INSERT INTO ErrAnexo3XI(IdFuncionario,Clave, Programa, NoAprobacion,  InversionAprobada, InversionEjercida, ObrasEntregadas, ObrasPorEntregar, UnidadMedida, CantidadTotal, Observacion ,TipoOrigen, DescripcionError) 
           	VALUES(@IdFuncionario, @Clave, @Programa, @NoAprobacion, @InversionAprobada, @InversionEjercida, @ObrasEntregadas, @ObrasPorEntregar,@UnidadMedida, @CantidadTotal, @Observacion,@TipoOrigen,  'Inversion Aprobada, Inversion Ejercida, Obras Entregadas, Obras Por Entregar y Cantidad Total  deben de ser Numéricos')
        END
   
        FETCH NEXT FROM Carga INTO @Clave, @Programa, @NoAprobacion, @InversionAprobada, @InversionEjercida, @ObrasEntregadas, @ObrasPorEntregar, @UnidadMedida, @CantidadTotal, @Observacion,@TipoOrigen
    END
	
    DELETE PasoAnexo3XI WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE  PROCEDURE [CargaAnexo3XII](@IdFuncionario  numeric)
AS 
    DECLARE 	@Clave varchar(20), 		@Obra varchar(50), 		@NoContrato varchar(50),		@NomContratista varchar(50)
    DECLARE	@CostoTotal varchar(20),	@AnticipoOtorgado varchar(20), 	@AnticipoAmortizado varchar(20),	@SaldoAnticipo varchar(20),		@Observacion varchar(255)
    DECLARE	@Tipo varchar(1),		@DescripcionError varchar(255)
    DECLARE 	@RegACargar numeric(6),	@RegError numeric(6)
    DECLARE	@nCosto numeric(22,2),		@nAnticipoO numeric(22,2),	@nAnticipoA numeric(22,2),		@nSaldo numeric(22,2)
    
    SET NOCOUNT ON
    PRINT 'ANEXO3XII'
    UPDATE ANEXO3XII SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario 
    DECLARE Carga CURSOR
        FOR SELECT	Clave, Obra, NoContrato, NombreContratista, CostoTotal, AnticipoOtorgado, AnticipoAmortizado, Observacion, TipoOrigen, SaldoAnticipoAmortizar
        FROM	PasoAnexo3XII
        WHERE	IdFuncionario = @IdFuncionario
	
    SET @RegACargar = 0
    SET @RegError = 0
   DELETE ErrAnexo3XII WHERE IdFuncionario = @IdFuncionario
    
    OPEN Carga
    FETCH NEXT FROM Carga INTO @Clave, @Obra, @NoContrato, @NomContratista, @CostoTotal, @AnticipoOtorgado, @AnticipoAmortizado, @Observacion, @Tipo, @SaldoAnticipo
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        
        IF LTRIM(@CostoTotal) = '' SET @CostoTotal = '0'
        SET @CostoTotal = REPLACE(@CostoTotal,',','')
        SET @CostoTotal = REPLACE(@CostoTotal,'$','')
        IF LTRIM(@AnticipoOtorgado) = '' SET @AnticipoOtorgado = '0'
        SET @AnticipoOtorgado = REPLACE(@AnticipoOtorgado,',','')
        SET @AnticipoOtorgado = REPLACE(@AnticipoOtorgado,'$','')
        IF LTRIM(@AnticipoAmortizado) = '' SET @AnticipoAmortizado = '0'
        SET @AnticipoAmortizado = REPLACE(@AnticipoAmortizado,',','')
        SET @AnticipoAmortizado = REPLACE(@AnticipoAmortizado,'$','')
        IF LTRIM(@SaldoAnticipo) = '' SET @SaldoAnticipo = '0'
        SET @SaldoAnticipo = REPLACE(@SaldoAnticipo,',','')
        SET @SaldoAnticipo = REPLACE(@SaldoAnticipo,'$','')
        IF ISNUMERIC(@CostoTotal) = 1  AND ISNUMERIC(@AnticipoOtorgado) = 1 AND ISNUMERIC(@AnticipoAmortizado) = 1 AND ISNUMERIC(@SaldoAnticipo) = 1
        BEGIN
            SET @nCosto = CAST(@CostoTotal AS NUMERIC(22, 2))
            SET @CostoTotal = substring(ltrim(CAST(@nCosto AS nvarchar(23))),1,20)
        
            SET @nAnticipoO = CAST(@AnticipoOtorgado AS NUMERIC(22, 2))
            SET @AnticipoOtorgado = substring(ltrim(CAST(@nAnticipoO AS nvarchar(23))),1,20)
        
            SET @nAnticipoA = CAST(@AnticipoAmortizado AS NUMERIC(22, 2))
            SET @AnticipoAmortizado = substring(ltrim(CAST(@nAnticipoA AS nvarchar(23))),1,20)
        
            SET @nSaldo = CAST(@SaldoAnticipo AS NUMERIC(22, 2))
            SET @SaldoAnticipo = substring(ltrim(CAST(@nSaldo AS nvarchar(23))),1,20)
        
            IF  LTRIM(RTRIM(@Tipo)) = '1' OR  LTRIM(RTRIM(@Tipo)) = '2' OR  LTRIM(RTRIM(@Tipo ))= '3' OR  LTRIM(RTRIM(@Tipo)) = '4' OR  LTRIM(RTRIM(@Tipo ))= '5'
            BEGIN
                INSERT INTO Anexo3XII(IdFuncionario, Clave, Obra, NoContrato, NombreContratista, CostoTotal,  AnticipoOtorgado, AnticipoAmortizado, Observacion, TipoOrigen, SaldoAnticipoAmortizar, UltimaCarga) 
                VALUES(@IdFuncionario, LTRIM(RTRIM(@Clave)), LTRIM(RTRIM(@Obra)), LTRIM(RTRIM(@NoContrato)), LTRIM(RTRIM(@NomContratista)), @CostoTotal, @AnticipoOtorgado, @AnticipoAmortizado, LTRIM(RTRIM(@Observacion)), @Tipo, @SaldoAnticipo, 1 )
                IF (@@ERROR <> 0) 
                BEGIN
                    SET @RegError = @RegError + 1
                    SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR			
                    
                    INSERT INTO ErrAnexo3XII(IdFuncionario, Clave, Obra, NoContrato, NombreContratista, CostoTotal, AnticipoOtorgado, AnticipoAmortizado, Observacion, TipoOrigen, SaldoAnticipoAmortizar, DescripcionError) 
                    VALUES(@IdFuncionario, @Clave, @Obra, @NoContrato, @NomContratista, @CostoTotal, @AnticipoOtorgado, @AnticipoAmortizado, @Observacion, @Tipo, @SaldoAnticipo, @DescripcionError)
                END
            END
            ELSE
            BEGIN
                SET @RegError = @RegError + 1
                INSERT INTO ErrAnexo3XII(IdFuncionario, Clave, Obra, NoContrato, NombreContratista, CostoTotal, AnticipoOtorgado, AnticipoAmortizado, Observacion, TipoOrigen, SaldoAnticipoAmortizar, DescripcionError) 
                VALUES(@IdFuncionario, @Clave, @Obra, @NoContrato, @NomContratista, @CostoTotal, @AnticipoOtorgado, @AnticipoAmortizado, @Observacion, @Tipo, @SaldoAnticipo, 'Tipo de Origen debe de ser 1,2,3,4 o 5')
            END
        END
        ELSE
        BEGIN
            SET @RegError = @RegError + 1
            INSERT INTO ErrAnexo3XII(IdFuncionario, Clave, Obra, NoContrato, NombreContratista, CostoTotal, AnticipoOtorgado, AnticipoAmortizado, Observacion, TipoOrigen, SaldoAnticipoAmortizar, DescripcionError) 
            VALUES(@IdFuncionario, @Clave, @Obra, @NoContrato, @NomContratista, @CostoTotal, @AnticipoOtorgado, @AnticipoAmortizado, @Observacion, @Tipo, @SaldoAnticipo, 'Costo Total, Anticipos Otorgados, Anticipos Amortizados, Saldo Anticipo por Amortizar y Tipo de Origen deben de ser Numérico')
        END
        FETCH NEXT FROM Carga INTO @Clave, @Obra, @NoContrato, @NomContratista, @CostoTotal, @AnticipoOtorgado, @AnticipoAmortizado, @Observacion, @Tipo, @SaldoAnticipo
    END
    
    DELETE PasoAnexo3XII WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE  PROCEDURE [CargaAnexo3XV](@IdFuncionario  numeric)
AS 
    DECLARE 	@Identificacion varchar(50),	@Expediente varchar(255),	@Periodo varchar(50),	@Ubicacion varchar(50)
    DECLARE	@Documento varchar(50), 	@DescripcionError varchar(255)
    DECLARE 	@RegACargar numeric(6),	@RegError numeric(6)
    SET NOCOUNT ON 
    PRINT 'ANEXO3XV'
    UPDATE ANEXO3XV SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario 
    DECLARE Carga CURSOR  
        FOR SELECT	Identificacion,Expediente, Periodo, Ubicacion, Documento
        FROM		PasoAnexo3XV
        WHERE	IdFuncionario = @IdFuncionario
    
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo3XV WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @Identificacion,@Expediente, @Periodo, @Ubicacion, @Documento
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        INSERT INTO Anexo3XV(IdFuncionario,Identificacion, Expediente, Periodo, Ubicacion, Documento, UltimaCarga) 
        VALUES(@IdFuncionario, LTRIM(RTRIM(@Identificacion)), LTRIM(RTRIM(@Expediente)), LTRIM(RTRIM(@Periodo)), LTRIM(RTRIM(@Ubicacion)), LTRIM(RTRIM(@Documento)), 1 )
        IF (@@ERROR <> 0)
        BEGIN
            SET @RegError = @RegError + 1
            SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
            INSERT INTO ErrAnexo3XV(IdFuncionario,Identificacion, Expediente, Periodo, Ubicacion, Documento, DescripcionError) 
            VALUES(@IdFuncionario, @Identificacion,@Expediente, @Periodo, @Ubicacion, @Documento, @DescripcionError)
        END
        FETCH NEXT FROM Carga INTO @Identificacion,@Expediente, @Periodo, @Ubicacion, @Documento
    END
    DELETE PasoAnexo3XV WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE  PROCEDURE [CargaAnexo3XVI](@IdFuncionario  numeric)
AS 
    DECLARE 	@Identificacion varchar(50),	@Expediente varchar(255),	@Periodo varchar(50)
    DECLARE	@Ubicacion varchar(50), 	@Documento varchar(50), 	@DescripcionError varchar(255)
    DECLARE 	@RegACargar numeric(6),	@RegError numeric(6)
    SET NOCOUNT ON 
    PRINT 'ANEXO3XVI'
    UPDATE ANEXO3XVI SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario 
    DECLARE Carga CURSOR  
        FOR SELECT	Identificacion, Expediente, Periodo, Ubicacion, Documento
        FROM		PasoAnexo3XVI
        WHERE	IdFuncionario = @IdFuncionario
    
    SET @RegACargar = 0
    SET @RegError = 0
    DELETE ErrAnexo3XVI WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @Identificacion, @Expediente, @Periodo, @Ubicacion, @Documento
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        INSERT INTO Anexo3XVI(IdFuncionario, Identificacion, Expediente, Periodo, Ubicacion, Documento, UltimaCarga) 
        VALUES(@IdFuncionario, LTRIM(RTRIM(@Identificacion)), LTRIM(RTRIM(@Expediente)), LTRIM(RTRIM(@Periodo)), LTRIM(RTRIM(@Ubicacion)), LTRIM(RTRIM(@Documento)), 1 )
        IF (@@ERROR <> 0)
        BEGIN
            SET @RegError = @RegError + 1
            SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
            INSERT INTO ErrAnexo3XVI(IdFuncionario, Identificacion, Expediente, Periodo, Ubicacion, Documento, DescripcionError) 
            VALUES(@IdFuncionario, @Identificacion, @Expediente, @Periodo, @Ubicacion, @Documento, @DescripcionError)
        END
        FETCH NEXT FROM Carga INTO @Identificacion, @Expediente, @Periodo, @Ubicacion, @Documento
    END
    DELETE PasoAnexo3XVI WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE  PROCEDURE [CargaAnexo3XVII](@IdFuncionario  numeric)
AS 
    DECLARE 	@Expediente varchar(50),	@Asunto varchar(50),		@FechaInicio varchar(10)
    DECLARE	@Situacion varchar(50), 		@FechaSolucion varchar(10), 	@DescripcionError varchar(255)
    DECLARE 	@RegACargar numeric(6),	@RegError numeric(6)
    SET NOCOUNT ON 
    PRINT 'ANEXO3XVII'
    UPDATE ANEXO3XVII SET UltimaCarga = 0 
        WHERE UltimaCarga = 1 
        AND IdFuncionario = @IdFuncionario 
    DECLARE Carga CURSOR  
        FOR SELECT	Expediente, Asunto, FechaInicio, Situacion, FechaSolucion
        FROM		PasoAnexo3XVII
        WHERE	IdFuncionario = @IdFuncionario
    
    SET @RegACargar = 0
    SET @RegError = 0
    --DELETE ErrAnexo3XVII WHERE IdFuncionario = @IdFuncionario
    OPEN Carga
    FETCH NEXT FROM Carga INTO @Expediente, @Asunto, @FechaInicio, @Situacion, @FechaSolucion
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RegACargar = @RegACargar + 1
        INSERT INTO Anexo3XVII(IdFuncionario, Expediente, Asunto, FechaInicio, Situacion, FechaSolucion, UltimaCarga) 
        VALUES(@IdFuncionario, LTRIM(RTRIM(@Expediente)), LTRIM(RTRIM(@Asunto)), LTRIM(RTRIM(@FechaInicio)), LTRIM(RTRIM(@Situacion)), LTRIM(RTRIM(@FechaSolucion)), 1 )
        IF (@@ERROR <> 0)
        BEGIN
            SET @RegError = @RegError + 1
            SELECT @DescripcionError = description FROM master.dbo.sysmessages WHERE error = @@ERROR
            INSERT INTO ErrAnexo3XVII(IdFuncionario, Expediente, Asunto, FechaInicio, Situacion, FechaSolucion, DescripcionError) 
            VALUES(@IdFuncionario, @Expediente, @Asunto, @FechaInicio, @Situacion, @FechaSolucion, @DescripcionError)
        END
        FETCH NEXT FROM Carga INTO @Expediente, @Asunto, @FechaInicio, @Situacion, @FechaSolucion
    END
    --DELETE PasoAnexo3XVII WHERE IdFuncionario = @IdFuncionario
    CLOSE Carga
    DEALLOCATE Carga
    SET NOCOUNT OFF
    SELECT @RegACargar AS RegistrosACargar, @RegError AS RegistrosConError

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE sel_Anexo1iiCountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo1ii ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE  PROCEDURE sel_Anexo1iiGetAll 
@IdFuncionario		int,
@ITEMSPAGINA	int,
@PAGINA		int
AS
DECLARE @strSELECT 	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY Numero, IdTipo, FechaSuscripcion '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, IdFuncionario, IdTipo, Numero, 
FechaSuscripcion, Duracion, Descripcion, ImporteTotal, Entidad, Observaciones FROM anexo1ii ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM 
anexo1ii ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE   PROCEDURE sel_Anexo1iiGetAll_SP 
@IdFuncionario		int  AS

SELECT IdRenglon, IdFuncionario, IdTipo, Numero, FechaSuscripcion, Duracion, Descripcion, ImporteTotal, Entidad, Observaciones 
FROM Anexo1II WITH (INDEX (IX_Anexo1II_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
ORDER BY Numero, IdTipo, FechaSuscripcion

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE sel_Anexo2iiiCountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo2iii ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE sel_Anexo2iiiGetAll 
@IdFuncionario		int,
@ITEMSPAGINA	int,
@PAGINA		int
AS
DECLARE @strSELECT 	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY NumeroOficio, Fecha, Concepto '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, IdFuncionario, NumeroOficio, Fecha, Concepto, Importe, Observaciones  FROM anexo2iii ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo2iii ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE  sel_Anexo2iiiGetAll_SP
@IdFuncionario		int AS

SELECT IdRenglon, IdFuncionario, NumeroOficio, Fecha, Concepto, Importe, Observaciones 
FROM Anexo2III  WITH  (INDEX (IX_Anexo2III_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario
ORDER BY NumeroOficio, Fecha, Concepto

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo2iv1CountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo2iv1 ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo2iv1GetAll 
@IdFuncionario		int,
@ITEMSPAGINA	int,
@PAGINA		int
AS
DECLARE @strSELECT 	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY NoCuenta, Nombre, Chequera '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, IdFuncionario, NoCuenta, Nombre, Chequera, Banco, Inicial, Final, Numero, Fecha, Importe FROM anexo2iv1 ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo2iv1 ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo2iv1GetAll_SP 
@IdFuncionario		int  AS

SELECT IdRenglon, IdFuncionario, NoCuenta, Nombre, Chequera, Banco, Inicial, Final, Numero, Fecha, Importe 
FROM Anexo2IV1 WITH (INDEX (IX_Anexo2IV1_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
ORDER BY NoCuenta, Nombre, Chequera

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo2iv2CountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo2iv2 ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo2iv2GetAll 
@IdFuncionario		int,
@ITEMSPAGINA	int,
@PAGINA		int
AS
DECLARE @strSELECT 	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY NoCheque, Banco, Beneficiario '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, IdFuncionario, Fecha, NoCuenta, Banco, Beneficiario, NoCheque, Importe FROM anexo2iv2 ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo2iv2 ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE  PROCEDURE sel_Anexo2iv2GetAll_SP 
@IdFuncionario		int  AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdRenglon, IdFuncionario, Fecha, NoCuenta, Banco, Beneficiario, NoCheque, Importe 
FROM Anexo2IV2 WITH (INDEX (IX_Anexo2IV2_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
ORDER BY NoCheque


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo2iv3CountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo2iv3 ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE  PROCEDURE sel_Anexo2iv3GetAll 
@IdFuncionario		int,
@ITEMSPAGINA	int,
@PAGINA		int
AS
DECLARE @strSELECT 	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY NoCuenta, NombreInstitucion, Fecha'
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, IdFuncionario, Fecha, NoCuenta, NombreInstitucion, TipoINversion, Vencimiento, Saldo FROM anexo2iv3 ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo2iv3 ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE  PROCEDURE sel_Anexo2iv3GetAll_SP 
@IdFuncionario		int  AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdRenglon, IdFuncionario, Fecha, NoCuenta, NombreInstitucion, TipoInversion, Vencimiento, Saldo
FROM Anexo2IV3 WITH (INDEX (IX_Anexo2IV3_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
ORDER BY NoCuenta, NombreInstitucion, Fecha


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo2ivCountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo2iv ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo2ivGetAll 
@IdFuncionario		int,
@ITEMSPAGINA	int,
@PAGINA		int
AS
DECLARE @strSELECT 	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY NombreInstitucion, NoCuenta, FechaVencimiento '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, IdFuncionario, NombreInstitucion, NoCuenta, TipoInversion, Saldo, FechaVencimiento  FROM anexo2iv ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo2iv ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE  PROCEDURE sel_Anexo2ivGetAll_SP 
@IdFuncionario		int  AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdRenglon, IdFuncionario, NombreInstitucion, NoCuenta, TipoInversion, Saldo, FechaVencimiento 
FROM Anexo2IV WITH (INDEX (IX_Anexo2IV_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
ORDER BY NombreInstitucion, NoCuenta, TipoInversion


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo2vCountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo2v ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo2vGetAll 
@IdFuncionario		int,
@ITEMSPAGINA	int,
@PAGINA		int
AS
DECLARE @strSELECT 	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY NumeroDocumento, NombreDeudor, FechaVencimiento '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, IdFuncionario, NumeroDocumento, NombreDeudor, Concepto, FechaVencimiento, Importe,Saldo  FROM anexo2v ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo2v ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE  PROCEDURE sel_Anexo2vGetAll_SP 
@IdFuncionario		int  AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdRenglon, IdFuncionario, NumeroDocumento, NombreDeudor, Concepto, FechaVencimiento, Importe, Saldo
FROM Anexo2V WITH (INDEX (IX_Anexo2V_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
ORDER BY NumeroDocumento, NombreDeudor, Concepto


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo2viCountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo2vi ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo2viGetAll 
@IdFuncionario		int,
@ITEMSPAGINA	int,
@PAGINA		int
AS
DECLARE @strSELECT 	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY NumeroDocumento, NombreAcreedor, FechaVencimiento '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, IdFuncionario, NumeroDocumento, NombreAcreedor, Concepto, FechaVencimiento, Importe,Saldo  FROM anexo2vi ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo2vi ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE  PROCEDURE sel_Anexo2viGetAll_SP 
@IdFuncionario		int  AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdRenglon, IdFuncionario, NumeroDocumento, NombreAcreedor, Concepto, FechaVencimiento, Importe, Saldo
FROM Anexo2VI WITH (INDEX (IX_Anexo2VI_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
ORDER BY NumeroDocumento, NombreAcreedor, Concepto


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sel_Anexo3iv1CountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3iv1 ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE   PROCEDURE sel_Anexo3iv1GetAll 
@IdFuncionario		int,
@ITEMSPAGINA		int,
@PAGINA			int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  	nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY ClaveTipoNomina, Observaciones, Nombre, Puesto, Categoria '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, IdFuncionario, Nombre, Puesto, Categoria, Adscripcion, TipoPlaza, SueldoBase, Compensacion, OtrasPrestaciones, Total, Observaciones, ClaveTipoNomina FROM anexo3iv1 ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo3iv1 ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE dbo.sel_Anexo3iv1GetAll_SP
@IdFuncionario		int  AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdRenglon, IdFuncionario, Nombre, Puesto, Categoria, Adscripcion, TipoPlaza, SueldoBase, Compensacion, 
OtrasPrestaciones, Total, Observaciones, ClaveTipoNomina 
FROM anexo3iv1 WITH  (INDEX (IX_Anexo3IV1_Func) NOLOCK)
WHERE IdFuncionario = @IdFuncionario
ORDER BY ClaveTipoNomina, Observaciones, Nombre, Puesto, Categoria

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE    PROCEDURE sel_Anexo3iv1RHCountAll 
@IdUnidadAdministrativa	int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)

DECLARE @IdFuncionario	int
SET @IdFuncionario = -1
Select @IdFuncionario = IdFuncionario From Cargo A 
        Where A.IdUnidadAdministrativa = @IdUnidadAdministrativa

    SET @strWHERE = ' WHERE ClaveTipoNomina IS NOT NULL AND IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
    SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3iv1 ' + @strWHERE 
    SET @strSQL = @strSELECT 
    --print  @strSQL
    EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE    PROCEDURE sel_Anexo3iv1RHGetAll 
@IdUnidadAdministrativa	int,
@ITEMSPAGINA		int,
@PAGINA			int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  	nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)

DECLARE @IdFuncionario	int
SET @IdFuncionario = -1
Select @IdFuncionario = IdFuncionario From Cargo A 
        Where A.IdUnidadAdministrativa = @IdUnidadAdministrativa

SET @strWHERE = ' WHERE ClaveTipoNomina IS NOT NULL AND IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY ClaveTipoNomina, Observaciones, Nombre, Puesto, Categoria '

SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, IdFuncionario, Nombre, Puesto, Categoria, Adscripcion, TipoPlaza, SueldoBase, Compensacion, OtrasPrestaciones, Total, Observaciones, ClaveTipoNomina FROM anexo3iv1 ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo3iv1 ' + @strWHERE + @strORDER + ')'


SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sel_Anexo3iv2CountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3iv2 ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE   PROCEDURE sel_Anexo3iv2GetAll 
@IdFuncionario		int,
@ITEMSPAGINA		int,
@PAGINA			int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  	nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY ClaveTipoNomina, Nomina, Nombre '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, IdFuncionario, Nomina, Nombre, Situacion, DeComisionado, AComisionado, FechaDePeriodo, FechaAPeriodo, Observaciones, ClaveTipoNomina FROM anexo3iv2 ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo3iv2 ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE  PROCEDURE sel_Anexo3iv2GetAll_SP 
@IdFuncionario		int  AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdRenglon, IdFuncionario, Nomina, Nombre, Situacion, DeComisionado, AComisionado, FechaDePeriodo, FechaAPeriodo, Observaciones, ClaveTipoNomina 
FROM Anexo3IV2 WITH (INDEX (IX_Anexo3IV2_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
ORDER BY Nomina, Nombre, Situacion


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE    PROCEDURE sel_Anexo3iv2RHCountAll 
@IdUnidadAdministrativa	int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)

DECLARE @IdFuncionario	int
SET @IdFuncionario = -1
Select @IdFuncionario = IdFuncionario From Cargo A 
        Where A.IdUnidadAdministrativa = @IdUnidadAdministrativa

SET @strWHERE = ' WHERE ClaveTipoNomina IS NOT NULL AND IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3iv2 ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE    PROCEDURE sel_Anexo3iv2RHGetAll 
@IdUnidadAdministrativa	int,
@ITEMSPAGINA		int,
@PAGINA			int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  	nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)

DECLARE @IdFuncionario	int
SET @IdFuncionario = -1
Select @IdFuncionario = IdFuncionario From Cargo A 
        Where A.IdUnidadAdministrativa = @IdUnidadAdministrativa

SET @strWHERE = ' WHERE ClaveTipoNomina IS NOT NULL AND IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY ClaveTipoNomina, Nomina, Nombre '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, IdFuncionario, Nomina, Nombre, Situacion, DeComisionado, AComisionado, FechaDePeriodo, FechaAPeriodo, Observaciones, ClaveTipoNomina FROM anexo3iv2 ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo3iv2 ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sel_Anexo3iv5CountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3iv5 ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE    PROCEDURE sel_Anexo3iv5GetAll 
@IdFuncionario		int,
@ITEMSPAGINA		int,
@PAGINA			int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  	nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY ClaveTipoNomina, Numero, Nombre '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, IdFuncionario, Numero, Nombre, Puesto, UnidadAdministrativa, ClaveTipoNomina FROM anexo3iv5 ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo3iv5 ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE dbo.sel_Anexo3iv5GetAll_SP
@IdFuncionario		int  AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdRenglon, IdFuncionario, Numero, Nombre, Puesto, UnidadAdministrativa, ClaveTipoNomina 
FROM anexo3iv5 WITH  (INDEX (IX_Anexo3IV5_Func) NOLOCK)
WHERE IdFuncionario = @IdFuncionario
ORDER BY ClaveTipoNomina, Numero, Nombre

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE    PROCEDURE sel_Anexo3iv5RHCountAll 
@IdUnidadAdministrativa	int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)

DECLARE @IdFuncionario	int
SET @IdFuncionario = -1
Select @IdFuncionario = IdFuncionario From Cargo A 
        Where A.IdUnidadAdministrativa = @IdUnidadAdministrativa

SET @strWHERE = ' WHERE ClaveTipoNomina IS NOT NULL AND IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3iv5 ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE     PROCEDURE sel_Anexo3iv5RHGetAll 
@IdUnidadAdministrativa	int,
@ITEMSPAGINA		int,
@PAGINA			int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  	nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)

DECLARE @IdFuncionario	int
SET @IdFuncionario = -1
Select @IdFuncionario = IdFuncionario From Cargo A 
        Where A.IdUnidadAdministrativa = @IdUnidadAdministrativa

SET @strWHERE = ' WHERE ClaveTipoNomina IS NOT NULL AND IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY ClaveTipoNomina, Numero, Nombre '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, IdFuncionario, Numero, Nombre, Puesto, UnidadAdministrativa, ClaveTipoNomina FROM anexo3iv5 ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo3iv5 ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE  PROCEDURE sel_Anexo3iv6GetAll_SP 
@IdFuncionario		int
AS

-- SELECCIONA EL ANEXO SIN PAGINACION

/*SELECT      a.IdCurso, a.IdEmpleado, a.Horas
FROM         dbo.Anexo3IV6 a INNER JOIN
                      dbo.Anexo3IV6Curso b ON a.IdCurso = b.IdCurso INNER JOIN
                      dbo.Anexo3IV6Empleado c ON a.IdEmpleado = c.IdEmpleado AND b.IdFuncionario = c.IdFuncionario
             AND b.IdFuncionario =  @IdFuncionario 
ORDER BY c.Nombre, a.IdEmpleado, b.Nombre, a.IdCurso*/
/*SELECT     b.IdCurso, b.Nombre, c.Nombre, isNull(a.IdEmpleado,0), isNull(a.Horas,0)
FROM         dbo.Anexo3IV6 a ,  dbo.Anexo3IV6Empleado c , dbo.Anexo3IV6Curso b 
WHERE     a.IdEmpleado =* c.IdEmpleado AND a.IdCurso =* b.IdCurso
and c.IdFuncionario = b.IdFuncionario 
 AND b.IdFuncionario =  @IdFuncionario 
ORDER BY c.Nombre, c.IdEmpleado, b.Nombre, b.IdCurso*/


SELECT      b.IdCurso, b.Nombre Curso, ISNULL(c.IdEmpleado, 0) AS IdEmpleado, c.Nombre AS Empleado, ISNULL(a.Horas, 0) AS Horas, ISNULL(a.IdEmpleado, -1) AS Ins
FROM         dbo.Anexo3IV6Curso b WITH (NOLOCK) INNER JOIN
                      dbo.Anexo3IV6Empleado c WITH (NOLOCK)  ON b.IdFuncionario = c.IdFuncionario LEFT OUTER JOIN
                      dbo.Anexo3IV6 a WITH (INDEX (IX_Anexo3IV6_CursoEmpleado) NOLOCK) ON c.IdEmpleado = a.IdEmpleado AND b.IdCurso = a.IdCurso
WHERE     (b.IdFuncionario = @IdFuncionario)
ORDER BY c.Nombre, c.IdEmpleado, b.Nombre, b.IdCurso

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3ixCountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3ix ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3ixGetAll 
@IdFuncionario		int,
@ITEMSPAGINA		int,
@PAGINA			int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  	nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY NoExpediente, NoProgresivo, Nombre '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdAnexo3ix, IdFuncionario, NoExpediente, NoProgresivo, Nombre, Destino, EstadoInmueble, TipoInmueble, TipoAccion,  Observaciones FROM anexo3ix ' + @strWHERE +
	' AND IdAnexo3ix NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdAnexo3ix FROM anexo3ix ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3ixGetAll_SP 
@IdFuncionario		int  AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdAnexo3IX, IdFuncionario, NoExpediente, NoProgresivo, Nombre, Destino, EstadoInmueble, TipoInmueble, TipoAccion, Observaciones 
FROM Anexo3IX WITH (INDEX (IX_Anexo3IX_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
ORDER BY NoExpediente, NoProgresivo, Nombre


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sel_Anexo3v1CountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3v1 ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



CREATE  PROCEDURE sel_Anexo3v1GetAll 
@IdFuncionario		int,
@ITEMSPAGINA		int,
@PAGINA			int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  	nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY Resguardante, NoInventario '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, NoInventario, Descripcion, Marca, Modelo, Serie, Valor, Ubicacion, Resguardante, Tipo FROM anexo3v1 ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo3v1 ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO



CREATE  PROCEDURE sel_Anexo3v1GetAll_SP 
@IdFuncionario		int  AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdRenglon, NoInventario, Descripcion, Marca, Modelo, Serie, Valor, Ubicacion, Resguardante, Tipo 
FROM Anexo3V1 WITH (INDEX (IX_Anexo3V1_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
ORDER BY Resguardante, NoInventario


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sel_Anexo3v2CountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3v2 ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE sel_Anexo3v2GetAll 
@IdFuncionario		int,
@ITEMSPAGINA		int,
@PAGINA			int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  	nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY NumFactura, Clave '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, Clave, NumFactura, Fecha, Concepto, Importe, Tipo FROM anexo3v2 ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo3v2 ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3v2GetAll_SP 
@IdFuncionario		int  AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdRenglon, Clave, NumFactura, Fecha, Concepto, Importe, Tipo
FROM Anexo3V2 WITH (INDEX (IX_Anexo3V2_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
ORDER BY NumFactura, Clave, Fecha
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sel_Anexo3v3CountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3v3 ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sel_Anexo3v3GetAll 
@IdFuncionario		int,
@ITEMSPAGINA		int,
@PAGINA			int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  	nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY  NumFactura, Clave '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, Clave, NumFactura, Fecha, Concepto, Importe, Tipo FROM anexo3v3 ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo3v3 ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3v3GetAll_SP 
@IdFuncionario		int  AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdRenglon, Clave, NumFactura, Fecha, Concepto, Importe, Tipo 
FROM Anexo3V3 WITH (INDEX (IX_Anexo3V3_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
ORDER BY NumFactura, Clave, Fecha
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sel_Anexo3v4CountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3v4 ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



CREATE  PROCEDURE sel_Anexo3v4GetAll 
@IdFuncionario		int,
@ITEMSPAGINA		int,
@PAGINA			int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  	nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY Resguardante, NoInventario '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, NoInventario, NoEconomico, Marca, Modelo, Color, Placas, Tipo, Serie, Resguardante, Observaciones FROM anexo3v4 ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo3v4 ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO



CREATE  PROCEDURE sel_Anexo3v4GetAll_SP 
@IdFuncionario		int  AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdRenglon, NoInventario, NoEconomico, Marca, Modelo, Color, Placas, Tipo, Serie, Resguardante, Observaciones 
FROM Anexo3V4 WITH (INDEX (IX_Anexo3V4_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
ORDER BY Resguardante, NoInventario



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sel_Anexo3v5CountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3v5 ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sel_Anexo3v5GetAll 
@IdFuncionario		int,
@ITEMSPAGINA		int,
@PAGINA			int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  	nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY Clave, Calibre '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, Clave, Calibre, Matricula, Nombre, Cargo FROM anexo3v5 ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo3v5 ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3v5GetAll_SP 
@IdFuncionario		int  AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdRenglon, Clave, Calibre, Matricula, Nombre, Cargo
FROM Anexo3V5 WITH (INDEX (IX_Anexo3V5_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
ORDER BY Clave, Calibre, Matricula


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sel_Anexo3v6CountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3v6 ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE sel_Anexo3v6GetAll 
@IdFuncionario		int,
@ITEMSPAGINA		int,
@PAGINA			int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  	nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY Clave, NumFactura '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, Clave, NumFactura, Fecha, Concepto, Importe, Tipo FROM anexo3v6 ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo3v6 ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3v6GetAll_SP 
@IdFuncionario		int  AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdRenglon, Clave, NumFactura, Fecha, Concepto, Importe, Tipo 
FROM Anexo3V6 WITH (INDEX (IX_Anexo3V6_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
ORDER BY Clave, NumFactura, Fecha


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3v7CountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3v7 ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3v7GetAll 
@IdFuncionario		int,
@ITEMSPAGINA	int,
@PAGINA		int
AS
DECLARE @strSELECT 	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY Titulo, Fecha, Autores '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, IdFuncionario, Titulo, Fecha, Autores, Nombre, Departamento, Tipo FROM anexo3v7 ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo3v7 ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3v7GetAll_SP 
@IdFuncionario		int  AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdRenglon, Titulo, Fecha, Autores, Nombre, Departamento, Tipo 
FROM Anexo3V7 WITH (INDEX (IX_Anexo3V7_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
ORDER BY Titulo, Fecha, Autores


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3viCountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3vi ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3viGetAll 
@IdFuncionario		int,
@ITEMSPAGINA	int,
@PAGINA		int
AS
DECLARE @strSELECT 	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY NoNombre, Unidad, PrecioUnitario '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdRenglon, IdFuncionario, NoNombre, Unidad, PrecioUnitario, Existencia, Importe,Observacion  FROM anexo3vi ' + @strWHERE +
	' AND IdRenglon NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdRenglon FROM anexo3vi ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3xCountAll 
@IdFuncionario		int,
@TipoOrigen		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
if @TipoOrigen='0'
begin
	SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
end
else
begin
	SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  + ' and TipoOrigen=' + LTRIM(RTRIM(STR(@TipoOrigen))) 
end
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3x ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3xGetAll 
@IdFuncionario		int,
@TipoOrigen		int,
@ITEMSPAGINA		int,
@PAGINA			int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  	nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
if @TipoOrigen=0
begin
	SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
end 
else
begin
	SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  +' and TipoOrigen=' + LTRIM(RTRIM(STR(@TipoOrigen)))
end
SET @strORDER =  ' ORDER BY TipoOrigen, Clave, Programa '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdAnexo3x, IdFuncionario, Clave, Programa, Tipo, MontoAprobado, MontoEjercido, FechaInicial, FechaFinal, AvanceFisico, AvanceFinanciero, Observacion ,TipoOrigen FROM anexo3x ' + @strWHERE +
	' AND IdAnexo3x NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdAnexo3x FROM anexo3x ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3xGetAll_SP 
@IdFuncionario		int,
@TipoOrigen  		int AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdAnexo3X, IdFuncionario, Clave, Programa, Tipo, MontoAprobado, MontoEjercido, FechaInicial, FechaFinal,	AvanceFisico, AvanceFinanciero, Observacion ,TipoOrigen 
FROM Anexo3X WITH (INDEX (IX_Anexo3X_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
AND (TipoOrigen = @TipoOrigen OR @TipoOrigen = 0)
ORDER BY TipoOrigen, Clave, Programa, Tipo


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3xiCountAll 
@IdFuncionario		int,
@TipoOrigen		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
if @TipoOrigen='0'
begin
	SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
end
else
begin
	SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  + ' and TipoOrigen=' + LTRIM(RTRIM(STR(@TipoOrigen))) 
end
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3xi ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3xiGetAll 
@IdFuncionario		int,
@TipoOrigen		int,
@ITEMSPAGINA		int,
@PAGINA			int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  	nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
if @TipoOrigen=0
begin
	SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
end 
else
begin
	SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  +' and TipoOrigen=' + LTRIM(RTRIM(STR(@TipoOrigen)))
end
SET @strORDER =  ' ORDER BY TipoOrigen, Clave, Programa '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdAnexo3xi, IdFuncionario, Clave, Programa, NoAprobacion, InversionAprobada, InversionEjercida, ObrasEntregadas, ObrasPorEntregar, UnidadMedida, CantidadTotal, Observacion ,TipoOrigen FROM anexo3xi ' + @strWHERE +
	' AND IdAnexo3xi NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdAnexo3xi FROM anexo3xi ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3xiGetAll_SP 
@IdFuncionario		int,
@TipoOrigen  		int AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdAnexo3XI, IdFuncionario, Clave, Programa, NoAprobacion, InversionAprobada, InversionEjercida, ObrasEntregadas, ObrasPorEntregar,	UnidadMedida, CantidadTotal, Observacion,TipoOrigen 
FROM Anexo3XI WITH (INDEX (IX_Anexo3XI_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
AND (TipoOrigen = @TipoOrigen OR @TipoOrigen = 0)
ORDER BY TipoOrigen, Clave, Programa, NoAprobacion 


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3xiiCountAll 
@IdFuncionario		int,
@TipoOrigen		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
IF @TipoOrigen='0'
BEGIN
	SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
END
ELSE
BEGIN
	SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  + ' and TipoOrigen=' + LTRIM(RTRIM(STR(@TipoOrigen))) 
END
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3xii ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3xiiGetAll 
@IdFuncionario		int,
@TipoOrigen		int,
@ITEMSPAGINA		int,
@PAGINA			int
AS
DECLARE @strSELECT 	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
IF @TipoOrigen=0
BEGIN
	SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
END
ELSE
BEGIN
	SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  +' and TipoOrigen=' + LTRIM(RTRIM(STR(@TipoOrigen)))
END
SET @strORDER =  ' ORDER BY TipoOrigen, Clave, Obra '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdAnexo3xii, IdFuncionario, Clave, Obra, NoContrato, NombreContratista, CostoTotal, AnticipoOtorgado, AnticipoAmortizado, Observacion, TipoOrigen, SaldoAnticipoAmortizar FROM anexo3xii ' + @strWHERE +
	' AND IdAnexo3xii NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdAnexo3xii FROM anexo3xii ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3xiiGetAll_SP 
@IdFuncionario		int,
@TipoOrigen  		int AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdAnexo3XII, IdFuncionario, Clave, Obra, NoContrato, CostoTotal, AnticipoOtorgado, AnticipoAmortizado, SaldoAnticipoAmortizar, NombreContratista, Observacion, TipoOrigen 
FROM Anexo3XII WITH (INDEX (IX_Anexo3XII_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
AND (TipoOrigen = @TipoOrigen OR @TipoOrigen = 0)
ORDER BY TipoOrigen, Clave, Obra, NoContrato 


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3xvCountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3xv ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3xvGetAll 
@IdFuncionario		int,
@ITEMSPAGINA	int,
@PAGINA		int
AS
DECLARE @strSELECT 	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY Ubicacion, Identificacion,Expediente, Periodo '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdAnexo3XV, IdFuncionario,Identificacion, Expediente, Periodo, Ubicacion, Documento  FROM anexo3xv ' + @strWHERE +
	' AND IdAnexo3XV NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdAnexo3XV FROM anexo3xv ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3xvGetAll_SP 
@IdFuncionario		int AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdAnexo3XV, IdFuncionario, Identificacion, Expediente, Periodo, Ubicacion, Documento
FROM Anexo3XV WITH (INDEX (IX_Anexo3XV_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
ORDER BY Ubicacion, Identificacion, Expediente, Periodo


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3xviCountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3xvi ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3xviGetAll 
@IdFuncionario		int,
@ITEMSPAGINA	int,
@PAGINA		int
AS
DECLARE @strSELECT 	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY Ubicacion, Identificacion, Expediente, Periodo '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdAnexo3XVI, IdFuncionario, Identificacion, Expediente, Periodo, Ubicacion, Documento FROM anexo3xvi WITH (INDEX (IX_Anexo3XVI_Func) NOLOCK) ' + @strWHERE +
	' AND IdAnexo3XVI NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdAnexo3XVI FROM anexo3xvi ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3xviGetAll_SP 
@IdFuncionario		int AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdAnexo3XVI, IdFuncionario, Identificacion, Expediente, Periodo, Ubicacion, Documento
FROM Anexo3XVI WITH (INDEX (IX_Anexo3XVI_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
ORDER BY Ubicacion, Identificacion, Expediente, Periodo


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3xviiCountAll 
@IdFuncionario		int
AS
DECLARE @strSELECT  	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strSELECT =  'SELECT COUNT(*) as AllCount FROM anexo3xvii ' + @strWHERE 
SET @strSQL = @strSELECT 
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3xviiGetAll 
@IdFuncionario		int,
@ITEMSPAGINA	int,
@PAGINA		int
AS
DECLARE @strSELECT 	nvarchar(3000)
DECLARE @strWHERE	nvarchar(2000)
DECLARE @strORDER  nvarchar(300)
DECLARE @strSQL 	nvarchar(4000)
SET @strWHERE = ' WHERE IdFuncionario = ' + LTRIM(RTRIM(STR(@IdFuncionario)))  
SET @strORDER =  ' ORDER BY Expediente, Asunto, FechaInicio '
SET @strSELECT =  'SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA))) + ' IdAnexo3XVII, IdFuncionario, Expediente, Asunto, FechaInicio, Situacion, FechaSolucion FROM anexo3xvii ' + @strWHERE +
	' AND IdAnexo3XVII NOT IN ( SELECT TOP ' + LTRIM(RTRIM(STR(@ITEMSPAGINA * (@PAGINA -1)))) + ' IdAnexo3XVII FROM anexo3xvii ' + @strWHERE + @strORDER + ')'
SET @strSQL = @strSELECT + @strORDER
--print  @strSQL
EXEC(@strSQL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE sel_Anexo3xviiGetAll_SP 
@IdFuncionario		int AS

-- SELECCIONA EL ANEXO SIN PAGINACION

SELECT IdAnexo3XVII, IdFuncionario, Expediente, Asunto, FechaInicio, Situacion, FechaSolucion
FROM Anexo3XVII WITH (INDEX (IX_Anexo3XVII_Func) NOLOCK) 
WHERE IdFuncionario = @IdFuncionario 
ORDER BY Expediente, Asunto, FechaInicio


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

