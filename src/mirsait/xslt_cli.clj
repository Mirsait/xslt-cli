 (ns mirsait.xslt-cli
  (:gen-class)
  (:import [javax.xml.transform TransformerFactory]
           [javax.xml.transform.stream StreamSource StreamResult]
           [java.io File]))

(defn transform->html [xml-path xslt-path output-path]
  (let [factory (TransformerFactory/newInstance)
        transformer (.newTransformer factory (StreamSource. (File. xslt-path)))
        xml-source (StreamSource. (File. xml-path))
        result (StreamResult. (File. output-path))]
    (.transform transformer xml-source result)
    (println "Transformation complete! Saved to" output-path)))

(defn -main [& args]
  (if (not= (count args) 3)
    (println "Usage: clj -M:run-m <input.xml> <transform.xsl> <output.html>")
    (apply transform->html args)))