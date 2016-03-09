import QtQuick 2.0
import VPlay 2.0
// do not import the VPlayPlugins folder here, otherwise on Android & iOS the QML importscanner would link a plugin also when it is not enabled, since Qt 5.4
//import VPlayPlugins.soomla 1.0

//Store {
Item {



  property int playerCredits



  property variant currency


  property int costPerLevel



  property variant levelEditorItem



  signal levelDownloadedSuccessfully(variant levelData)


  signal levelDownloadedError(variant levelData, variant errorData)





  signal levelBoughtSuccessfully(variant levelData)












  function buyLevel(levelData) {
  }



  function buyCurrencyPack(currencyPackItemId) {
  }


  function giveCurrency(amount) {
  }


  function resetCurrency() {
  }


  function clearAllBoughtLevels() {
  }


  // interface from Soomla Store plugin
  property string licenseKey
  property string secret
  property int version
  property string androidPublicKey
  property bool supported

  property variant currencies
  property variant currencyPacks
  property variant goods

  signal currencyBalanceChanged(string itemId, int balance, int amountAdded)
  signal goodBalanceChanged(string itemId, int balance, int amountAdded)
  signal goodEquipped(string itemId)
  signal goodUnequipped(string itemId)
  signal goodUpgrade(string itemId, string upgradeItemId)
  signal itemPurchased(string itemId)
  signal storePurchaseCanceled(string itemId)
  signal storePurchaseCancelled(string itemId)
  signal storePurchased(string itemId)
  signal storePurchaseStarted(string itemId)
  signal storeRefund(string itemId)
  signal restoreAllTransactionsStarted()
  signal restoreAllTransactionsFinished(bool success)
  signal unexpectedError()
  signal itemNotFoundError(string itemId)
  signal insufficientFundsError()


}
