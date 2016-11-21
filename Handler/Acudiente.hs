module Handler.Acudiente where

import Import
import Yesod.Form.Bootstrap3 (BootstrapFormLayout (..), renderBootstrap3)
import Text.Julius (RawJS (..))
--data Acudiente = Acudiente
--		{ nombre :: Text }
--acudienteForm :: AForm Handler Attendant
--acudienteForm = Attendant
--			<$> areq textField ( bfs ("nombre" :: Text)) Nothing
--			<$> areq textField ( bfs ("apellido" :: Text)) Nothing
--			<$> areq textField ( bfs ("parentesco" :: Text)) Nothing
acudienteForm :: Form Attendant
acudienteForm = renderBootstrap3 BootstrapBasicForm $ Attendant

			<$> areq textField "Nombre: " Nothing
			<*> areq textField "Apellido: " Nothing
			<*> areq textField "Parentesco: " Nothing
getAcudienteR :: Handler Html
getAcudienteR = do
	(formWidget, formEnctype) <- generateFormPost acudienteForm
	defaultLayout $ do
		$(widgetFile "/acudientes/new")
postAcudienteR :: Handler Html
postAcudienteR = do
	((result, formWidget), formEnctype) <- runFormPost acudienteForm
	defaultLayout $ do
		$(widgetFile "/acudientes/new")
